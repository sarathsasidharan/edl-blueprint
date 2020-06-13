#!/bin/sh
# Deploy an Enterprise Data Lake Infra on Azure , this is the master script

#Declare Script Paths
CONFIG_PATH="config/azure.config"
LOGIN_TEARDOWN_PATH="login/login.sh"
NETWORK_PATH="network/create-network.sh"
RESOURCE_GROUP_PATH="resource-group/create-rg.sh"


#Import Functions needed to create Infra.
source $CONFIG_PATH
source $LOGIN_TEARDOWN_PATH
source $NETWORK_PATH
source $RESOURCE_GROUP_PATH


#################### Start Creation ########################

echo "This is where the Base EDL Infrastructure is Spun Up"

azlogin 
create_resource_group $RG_NAME $RG_LOCATION
create_virtual_network $RG_NAME $DEPARTMENT_0 $VNET_DEP0
#shutdown $RG_NAME

#################### End Creation ########################