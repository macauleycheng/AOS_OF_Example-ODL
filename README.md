# AOS_OF_Example-ODL

It Opendaylight RESTconf API usage example for AOS hybrid mode openflow.

Please Have a Opendaylight Controller fisrt and have switch connect with Controller.


JSON<->XML Online Convert Tool:
http://www.utilities-online.info/xmltojson/#.VQjTxY6UdPM


NOTE:
OpenDaylight doesn't provide delete all groups by a xml, the file "deleteAllGroup.xml" can be use to delete a
group only, the deleting group id shall put on RestAPI url.
ex, to delte group 655362 and use the "deleteAllGroup.xml".
http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/group/655362
