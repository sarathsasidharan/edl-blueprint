#!/bin/sh
# Deploy an Enterprise Data Lake Infra on Azure

CONFIG_PATH="config/azure.config"

#Import Functions needed to create Infra.
source $CONFIG_PATH

echo "This is where networking starts"

create_virtual_network()
{
  DEPARTMENT_NAME=$1
  VNET_RANGE=$2

  echo "VNET FOR $DEPARTMENT_NAME"
  az network vnet create -g $RG_LOCATION -n $DEPARTMENT_NAME+"_VNET" --address-prefix $VNET_RANGE
}