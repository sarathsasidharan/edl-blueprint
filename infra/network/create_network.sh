#!/bin/sh
# Deploy an Enterprise Data Lake Infra on Azure

CONFIG_PATH="config/azure.config"

#Import Functions needed to create Infra.
source $CONFIG_PATH

echo "This is where networking starts"

create_virtual_network()
{
  DEPARTMENT_NAME=$1

  echo "VNET FOR $DEPARTMENT_NAME"
  az network vnet create -g MyResourceGroup -n MyVnet --address-prefix 10.0.0.0/16
}