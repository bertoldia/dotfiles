// ==UserScript==
// @name           CSE Review Link to Repo Branch
// @version        0.1
// @author         Axel von Bertoldi
// @license GPL version 3 or any later version; http://www.gnu.org/copyleft/gpl.html
// ==/UserScript==+

nodes = document.getElementsByClassName("rec_kv1_val")
repo = nodes[1].innerHTML
branch = nodes[2].innerHTML
nodes[2].innerHTML='<a href="http://webed.spgear.lab.emc.com/cgi-bin/login/cgit/cgit.cgi/' + repo + '/log/?h=' + branch + '"  target="_blank">' + branch + '</a>'
