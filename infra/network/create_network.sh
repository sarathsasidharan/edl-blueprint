#!/bin/sh
# Deploy an Enterprise Data Lake Infra on Azure

CONFIG_PATH="config/azure.config"

#Import Functions needed to create Infra.
source $CONFIG_PATH

echo "This is where networking starts"

create_virtual_network()
{
  RESOURCE_GRP=$1
  DEPARTMENT_NAME=$2
  VNET_RANGE=$3

  echo "Creating VNET FOR $DEPARTMENT_NAME"
  az network vnet create -g $RESOURCE_GRP -n $DEPARTMENT_NAME"_vnet" --address-prefix $VNET_RANGE
}