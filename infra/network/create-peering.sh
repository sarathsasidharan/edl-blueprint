#!/bin/sh
# Deploy an Enterprise Data Lake Infra on Azure


echo "Network Peering starts here"

create_virtual_network_peering()
{
  RESOURCE_GRP=$1
  DEPARTMENT_VNET_NAME="$2_VNET"
  DEPARTMENT_REMOTE_VNET_NAME="$3_VNET"

  echo "VNET Peering FOR $DEPARTMENT_VNET_NAME and $DEPARTMENT_REMOTE_VNET_NAME" 
  az network vnet peering create -g $RESOURCE_GRP \
                                 -n $DEPARTMENT_VNET_NAME"_PEERING" \
                                 --vnet-name $DEPARTMENT_VNET_NAME \
                                 --remote-vnet $DEPARTMENT_REMOTE_VNET_NAME \
                                 --allow-vnet-access
}