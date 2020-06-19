#!/bin/sh
# Deploy an Enterprise Data Lake Infra on Azure , this is the master script

#Declare Script Paths
CONFIG_PATH="config/azure.config"
LOGIN_TEARDOWN_PATH="login/login.sh"
NETWORK_VNET_PATH="network/create_network.sh"
NETWORK_VNET_PEER_PATH="network/create-peering.sh"
RESOURCE_GROUP_PATH="resource-group/create_rg.sh"


#Import Functions needed to create Infra.
source $CONFIG_PATH
source $LOGIN_TEARDOWN_PATH
source $NETWORK_VNET_PATH
source $NETWORK_VNET_PEER_PATH
source $RESOURCE_GROUP_PATH



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

#shutdown $RG_NAME

#################### End Creation ########################