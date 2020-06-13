#!/bin/sh
# Deploy an Enterprise Data Lake Infra on Azure , this is the master script

#Declare Script Paths
NETWORK_SCRIPT="network/create-network.sh"
RESOURCE_GROUP_SCRIPT="resource-group/create-rg.sh"
CONFIG_PATH="config/azure.config"

#Import Functions needed to create Infra.
source $CONFIG_PATH
source $NETWORK_CREATION_SCRIPT
source $RESOURCE_GROUP_SCRIPT



#Function to Login to Azure / Can be removed when triggered from AzDevOps
login() {
    echo "Login to Azure"
    az login
}


#################### Start Creation ########################

echo "This is where the Base EDL Infrastructure is Spun Up"

login 
create_resource_group $RG_NAME $RG_LOCATION
create_virtual_network $DEPARTMENT_0 $VNET_DEP0


#################### End Creation ########################