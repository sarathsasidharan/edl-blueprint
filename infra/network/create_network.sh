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
  az network vnet create -g $RESOURCE_GRP -n "vnet-"$DEPARTMENT_NAME --address-prefix $VNET_RANGE
}

create_subnet()
{
  RESOURCE_GRP=$1 
  VNET = $2
  SUBNET_NAME=$3
  SUBNET_RANGE=$4

  echo "Creating Subnet $SUBNET_NAME For Specified VNet $VNET  with subnet range $SUBNET_RANGE"
  az network vnet subnet create --name $SUBNET_NAME --resource-group $RESOURCE_GRP --vnet-name $VNET --address-prefixes $SUBNET_RANGE
}


create_nsg()
{
  RESOURCE_GRP=$1
  NSG=$2
  LOCATION=$3
  az network nsg create --name $nsg --resource-group $resource --location "$location"
}