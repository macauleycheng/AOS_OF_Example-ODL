#!/bin/sh

#This script is assumed to be run on the host where ODL controller is running.
#To run the scripts from a remote machine, change the controller IP accordingly.
controller_ip=192.168.1.4
#Node ID: When OpenDayLight controller starts, this is the switch ID known 
#to the controller. Check "printNodes" at the OSGI interface
openflow_node=openflow:123638415924954

echo "l2-interface-group_port2_vlan100_untag.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X PUT \
     --data "@./l2-interface-group_port2_vlan100_untag.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/group/6553602
