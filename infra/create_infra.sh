#!/bin/sh
# Deploy an Enterprise Data Lake Infra on Azure , this is the master script

#Declare Script Paths
CONFIG_PATH="config/azure.config"
LOGIN_TEARDOWN_PATH="login/login.sh"
NETWORK_VNET_PATH="network/create_network.sh"
NETWORK_VNET_PEER_PATH="network/create_peering.sh"
RESOURCE_GROUP_PATH="resource-group/create_rg.sh"
POLICY_PATH="policy/policies.sh"


#Policy Variables 
POLICY_REGION_DISP="audit-location-data-lake"
POLICY_REGION="e56962a6-4747-49cd-b67b-bf8b01975c4c"
POLICY_REGION_PARAM="regions.parameters.json"

POLICY_VNET="vm-creation-in-approved-vnet"
POLICY_VNET_DISPLAY_NAME="Use approved vNet for Deploying VMs"
POLICY_VNET_DESC="This policy enforces VMs to be deployed in approved vNets."
POLICY_VNET_DISP="audit-vm-deployment-data-lake"
POLICY_VNET0_PARAM="vnet0.parameters.json"
POLICY_VNET1_PARAM="vnet1.parameters.json"
POLICY_VNET2_PARAM="vnet2.parameters.json"
POLICY_VNET3_PARAM="vnet3.parameters.json"
POLICY_VNET4_PARAM="vnet4.parameters.json"

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


create_nsg $RG_NAME_DEP0 $NSG_DEP0 $RG_LOCATION
create_nsg $RG_NAME_DEP1 $NSG_DEP1 $RG_LOCATION
create_nsg $RG_NAME_DEP2 $NSG_DEP2 $RG_LOCATION
create_nsg $RG_NAME_DEP3 $NSG_DEP3 $RG_LOCATION
create_nsg $RG_NAME_DEP4 $NSG_DEP4 $RG_LOCATION



#Create Custom Policies
create_policy $POLICY_VNET $POLICY_VNET_DISPLAY_NAME $POLICY_VNET_DESC 

#Assign location restriction policy
assign_policy $POLICY_REGION_DISP $RG_NAME_DEP0 $POLICY_REGION $POLICY_REGION_PARAM
assign_policy $POLICY_REGION_DISP $RG_NAME_DEP1 $POLICY_REGION $POLICY_REGION_PARAM
assign_policy $POLICY_REGION_DISP $RG_NAME_DEP2 $POLICY_REGION $POLICY_REGION_PARAM
assign_policy $POLICY_REGION_DISP $RG_NAME_DEP3 $POLICY_REGION $POLICY_REGION_PARAM
assign_policy $POLICY_REGION_DISP $RG_NAME_DEP4 $POLICY_REGION $POLICY_REGION_PARAM

#Assign vnet restriction on resource groups level
assign_policy $POLICY_VNET_DISP $RG_NAME_DEP0 $POLICY_VNET $POLICY_VNET0_PARAM
assign_policy $POLICY_VNET_DISP $RG_NAME_DEP1 $POLICY_VNET $POLICY_VNET1_PARAM
assign_policy $POLICY_VNET_DISP $RG_NAME_DEP2 $POLICY_VNET $POLICY_VNET2_PARAM
assign_policy $POLICY_VNET_DISP $RG_NAME_DEP3 $POLICY_VNET $POLICY_VNET3_PARAM
assign_policy $POLICY_VNET_DISP $RG_NAME_DEP4 $POLICY_VNET $POLICY_VNET4_PARAM
#shutdown $RG_NAME

#################### End Creation ########################