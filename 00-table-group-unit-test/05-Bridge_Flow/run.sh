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
#echo "table50_deleteAllFlow.xml"
#curl -v -H "Content-Type: application/xml" \
#     -H "Accept: application/xml" \
#     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
#     -X DELETE \
#     --data "@$(pwd)/../../table50_deleteAllFlow.xml" \
#     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/table/50

#PUT L2 Interface Group, ouput port1, vlan2, pop
echo "l2-interface-group_port1_vlan10.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X PUT \
     --data "@./l2-interface-group_port1_vlan10.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/group/655361

echo "l2-interface-group_port2_vlan10.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X PUT \
     --data "@./l2-interface-group_port2_vlan10.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/group/655362

echo "l2_mcast_group_vlan10.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X PUT \
     --data "@./l2_mcast_group_vlan10.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/group/805961729

echo "l2_flood_group_vlan10.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X PUT \
     --data "@./l2_flood_group_vlan10.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/group/1074397185

echo "50_flow_dlf.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X PUT \
     --data "@./50_flow_dlf.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/table/50/flow/1

echo "50_mcast_flow.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X PUT \
     --data "@./50_mcast_flow.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/table/50/flow/2

echo "50_unicast_flow.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X PUT \
     --data "@./50_unicast_flow.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/table/50/flow/3
	 