#!/bin/sh
# Deploy an Enterprise Data Lake Infra on Azure , this is the master script

#Declare Script Paths
CONFIG_PATH="config/azure.config"
LOGIN_TEARDOWN_PATH="login/login.sh"
NETWORK_VNET_PATH="network/create_network.sh"
NETWORK_VNET_PEER_PATH="network/create-peering.sh"
RESOURCE_GROUP_PATH="resource-group/create_rg.sh"
POLICY_PATH="policy/policies.sh"


#Policy Variables
POLICY_REGION="audit-location-data-lake"
POLICY_REGION_ID="e56962a6-4747-49cd-b67b-bf8b01975c4c"
POLICY_REGION_PARAM="allowed-locations"


#Import Functions needed to create Infra.
source $CONFIG_PATH
source $LOGIN_TEARDOWN_PATH
source $NETWORK_VNET_PATH
source $NETWORK_VNET_PEER_PATH
source $RESOURCE_GROUP_PATH
source $POLICY_PATH



#################### Start Creation ########################

echo "This is where the Base EDL Infrastructure is Spun Up"

azlogin 

create_resource_group $RG_NAME_DEP0 $RG_LOCATION
create_resource_group $RG_NAME_DEP1 $RG_LOCATION
create_resource_group $RG_NAME_DEP2 $RG_LOCATION
create_resource_group $RG_NAME_DEP3 $RG_LOCATION
create_resource_group $RG_NAME_DEP4 $RG_LOCATION

create_virtual_network $RG_NAME_DEP0 $DEPARTMENT_0 $VNET_DEP0
create_virtual_network $RG_NAME_DEP1 $DEPARTMENT_1 $VNET_DEP1
create_virtual_network $RG_NAME_DEP2 $DEPARTMENT_2 $VNET_DEP2
create_virtual_network $RG_NAME_DEP3 $DEPARTMENT_3 $VNET_DEP3
create_virtual_network $RG_NAME_DEP4 $DEPARTMENT_4 $VNET_DEP4


create_virtual_network_peering $RG_NAME_DEP0 $RG_NAME_DEP1 $DEPARTMENT_0 $DEPARTMENT_1
create_virtual_network_peering $RG_NAME_DEP0 $RG_NAME_DEP2 $DEPARTMENT_0 $DEPARTMENT_2
create_virtual_network_peering $RG_NAME_DEP0 $RG_NAME_DEP3 $DEPARTMENT_0 $DEPARTMENT_3
create_virtual_network_peering $RG_NAME_DEP0 $RG_NAME_DEP4 $DEPARTMENT_0 $DEPARTMENT_4


assign_policy $POLICY_REGION $RG_NAME_DEP0 $POLICY_REGION_ID $POLICY_REGION_PARAM
assign_policy $POLICY_REGION $RG_NAME_DEP1 $POLICY_REGION_ID $POLICY_REGION_PARAM
assign_policy $POLICY_REGION $RG_NAME_DEP2 $POLICY_REGION_ID $POLICY_REGION_PARAM
assign_policy $POLICY_REGION $RG_NAME_DEP3 $POLICY_REGION_ID $POLICY_REGION_PARAM
assign_policy $POLICY_REGION $RG_NAME_DEP4 $POLICY_REGION_ID $POLICY_REGION_PARAM

#shutdown $RG_NAME

#################### End Creation ########################