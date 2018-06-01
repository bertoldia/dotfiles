#!/bin/python
import click
from datetime import datetime
import re

CLASS_REGEX=re.compile("public class (?P<class>[A-Za-z]*) extends BaseActivity {.*")
ID_REGEX=re.compile('public static final String ID = "(?P<id>.*)";.*')
DOC_REGEX=re.compile('@DocumentedActivity\("(?P<doc>.*)"\).*')

DBVS_FILE_NAME = "backoffice/src/main/java/com/technisys/omnichannel/dbvs/backoffice/y{}/{}.java"

TEMPLATE = """package com.technisys.omnichannel.dbvs.backoffice.y{};

import com.technisys.omnichannel.DBVSUpdate;
import com.technisys.omnichannel.core.activities.ActivityDescriptor;
import com.technisys.omnichannel.core.activities.ClientActivityDescriptor;

public class {} extends DBVSUpdate {{

    @Override
    public void up() {{
        deleteActivity("{}");
        insertActivity(
                "{}",
                "{}",
                "{}",
                "{}",
                ActivityDescriptor.AuditLevel.Full,
                ClientActivityDescriptor.Kind.Other,
                null);
    }}
}}
"""

@click.command()
@click.argument('activity', type=click.File('rb'))
@click.option('-n', '--dry-run', default=False, is_flag=True,
              help="Print the generated file to stdout instead of a file.")
def make_activity_dbvs(activity, dry_run):
    """Generate a DBVS class to expose the specified Activity file."""

    activity_package = activity.readline().split(b' ')[1][0:-2].decode()

    for line in activity:
        match = CLASS_REGEX.search(str(line))
        if match:
            activity_class_name = (match["class"])
            continue

        match = ID_REGEX.search(str(line))
        if match:
            activity_id = (match["id"])
            continue

        match = DOC_REGEX.search(str(line))
        if match:
            activity_doc = (match["doc"])
            continue

    activity_class_path = activity_package + "." + activity_class_name
    activity_namespace = activity_id.split('.')[0]
    now = datetime.now()
    dbvs_class_name = "DB{}{:02d}{:02d}_{:02d}{:02d}_{}".format(now.year, now.month, now.day,
        now.hour, now.minute, str(now.microsecond)[0:3])

    content = TEMPLATE.format(now.year, dbvs_class_name, activity_id,
                              activity_id, activity_class_path, activity_doc,
                              activity_namespace)

    file_name = DBVS_FILE_NAME.format(now.year, dbvs_class_name)

    if dry_run:
        print(content)
    else:
        with open(file_name, "w", encoding="utf-8") as out:
            out.write(content)
        print("Wrote {}".format(file_name))

if __name__ == '__main__':
    make_activity_dbvs()
