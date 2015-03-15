#!/bin/sh

#This script is assumed to be run on the host where ODL controller is running.
#To run the scripts from a remote machine, change the controller IP accordingly.
controller_ip=192.168.1.5
#Node ID: When OpenDayLight controller starts, this is the switch ID known 
#to the controller. Check "printNodes" at the OSGI interface
openflow_node=openflow:123638411226060

#clear all groups
curl -v -H "Content-Type: application/xml"\
     -H "Accept: application/xml"\
     -H "Authorization: Basic YWRtaW46YWRtaW4="\
	 -X DELETE \
     --data "@$(pwd)/../../deleteAllGroup.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/group/4294967292
	 
#PUT L2 Interface Group, ouput port1, vlan2, pop
curl -v -H "Content-Type: application/xml"\
     -H "Accept: application/xml"\
     -H "Authorization: Basic YWRtaW46YWRtaW4="\
	 -X PUT \
     --data "@l2-interface-group.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/group/131073