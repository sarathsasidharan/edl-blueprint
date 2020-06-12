#!/bin/sh
# Deploy an Enterprise Data Lake Infra on Azure , this is the master script

#Declare Script Paths
NETWORK_CREATION_SCRIPT="network/create_network.sh"
CONFIG_PATH="config/azure.config"

#Import Functions needed to create Infra.
source $CONFIG_PATH
source $NETWORK_CREATION_SCRIPT



#Function to Login to Azure
startup() {
   
    RG_NAME=$1
    RG_LOCATION=$2

    echo "Login to Azure"
    az login
    echo "Create Resource Group $RG_NAME in location $RG_LOCATION"
    az group create -n $RG_NAME -l $RG_LOCATION
}


########## Start Creation ########################

echo "This is where the Base EDL Infrastructure is Spun Up"

startup $RESOURCE_GROUP_NAME $RG_LOCATION
create_virtual_network $DEPARTMENT_1

