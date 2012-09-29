#!/bin/bash

SMS_DIR=$(ls -d smsv2-D*)

EXTRA_OPTS="-s 51112"

case `hostname` in
    sms-build)
        TMPDIR=""
        TESTTOOLS=""
        EXTRA_JVM_OPTS="$TMPDIR $TESTTOOLS $EXPORT_JVM_OPTS";
        ;;
esac

EXTRA_JVM_OPTS="$EXTRA_JVM_OPTS -DlinuxTowerSetupArgsFile=linuxTowerSetupArgs.py"

export EXTRA_JVM_OPTS

DBG_PORT=$1

CMD="${SMS_DIR}/VPlexcli --cli-directory cli ${EXTRA_OPTS}"

if [ ! -z ${DBG_PORT} ]; then
    ${SMS_DIR}/jdb.sh --dbgport=${DBG_PORT} ${CMD}
else
    ${CMD}
fi




