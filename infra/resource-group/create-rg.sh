    #!/bin/sh
# Deploy an Enterprise Data Lake Infra on Azure

CONFIG_PATH="config/azure.config"

#Import Functions needed to create Infra.
source $CONFIG_PATH

echo " Resource Group Deployment in Azure"

create_resource_group()
{
    RES_GROUP_NAME=$1
    RESOURCE_LOCATION=$2
    
    echo "Create Resource Group $RES_GROUP_NAME in location $RESOURCE_LOCATION"
    az group create -n $RES_GROUP_NAME -l $RESOURCE_LOCATION
    echo "Cretion of Resource Group $RES_GROUP_NAME in location $RESOURCE_LOCATION succeeded"
}
    
    