#!/bin/sh

#This script is assumed to be run on the host where ODL controller is running.
#To run the scripts from a remote machine, change the controller IP accordingly.
controller_ip=192.168.1.4
#Node ID: When OpenDayLight controller starts, this is the switch ID known 
#to the controller. Check "printNodes" at the OSGI interface
openflow_node=openflow:123638415924954

#clear all flows
echo "table50_deleteAllFlow.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X DELETE \
     --data "@$(pwd)./table50_deleteAllFlow.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/table/50

echo "table10_deleteAllFlow.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X DELETE \
     --data "@$./table10_deleteAllFlow.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/table/50

#PUT L2 Interface Group
echo "l2-interface-group_port2_vlan100_untag.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X PUT \
     --data "@./l2-interface-group_port1_vlan100_untag.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/group/6553601

echo "l2-interface-group_port2_vlan100_untag.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X PUT \
     --data "@./l2-interface-group_port2_vlan100_untag.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/group/6553602

echo "10_add_port1_allow_rx_tag_vid_100.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X PUT \
     --data "@./10_add_port1_allow_rx_tag_vid_100.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/table/10/flow/1
     
echo "50_000000000010_vlan_100.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X PUT \
     --data "@./50_000000000010_vlan_100.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/table/50/flow/1

echo "60_ACL.xml"
curl -v -H "Content-Type: application/xml" \
     -H "Accept: application/xml" \
     -H "Authorization: Basic YWRtaW46YWRtaW4=" \
     -X PUT \
     --data "@./60_ACL.xml" \
     http://$controller_ip:8181/restconf/config/opendaylight-inventory:nodes/node/$openflow_node/table/60/flow/1

     