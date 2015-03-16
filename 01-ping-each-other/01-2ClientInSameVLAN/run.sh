#!/bin/sh

#This script is assumed to be run on the host where ODL controller is running.
#To run the scripts from a remote machine, change the controller IP accordingly.
controller_ip=192.168.1.5
#Node ID: When OpenDayLight controller starts, this is the switch ID known 
#to the controller. Check "printNodes" at the OSGI interface
openflow_node=openflow:123638411226060

#clear all groups
echo "deleteAllGroup.xml"
curl -v -H "Content-Type: application/xml"\
     -H "Accept: application/xml"\
     -H "Authorization: Basic YWRtaW46YWRtaW4="\
	 -X DELETE \
     --data "@$(pwd)/../../deleteAllGroup.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/group/4294967292

#clear all flows
echo "table50_deleteAllFlow.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X DELETE \
     --data "@$(pwd)/../../table50_deleteAllFlow.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/table/50
echo "table10_deleteAllFlow.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X DELETE \
     --data "@$(pwd)/../../table10_deleteAllFlow.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/table/50

#PUT L2 Interface Group, ouput port1, vlan2, pop
echo "group_a0001_to_port1.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X PUT \
     --data "@./group_a0001_to_port1.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/group/655361

echo "group_a0002_to_port2.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X PUT \
     --data "@./group_a0002_to_port2.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/group/655362

echo "group_400a0001_l2_flood.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X PUT \
     --data "@./group_400a0001_l2_flood.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/group/1074397185

echo "table10_add_port1_to_vlan10.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X PUT \
     --data "@./table10_add_port1_to_vlan10.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/table/10/flow/1
	 
	 
echo "table10_add_port2_to_vlan10.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X PUT \
     --data "@./table10_add_port2_to_vlan10.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/table/10/flow/2

echo "table50_add_client1_on_port1.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X PUT \
     --data "@./table50_add_client1_on_port1.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/table/50/flow/1

echo "table50_add_client2_on_port2.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X PUT \
     --data "@./table50_add_client2_on_port2.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/table/50/flow/2

echo "table50_flood_bcast.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X PUT \
     --data "@./table50_flood_bcast.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/table/50/flow/3
	 