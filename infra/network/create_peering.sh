#!/bin/sh
# Deploy an Enterprise Data Lake Infra on Azure


echo "Network Peering starts here"

create_virtual_network_peering()
{
  RESOURCE_GRP=$1
  RESOURCE_GRP_REMOTE=$2
  DEPARTMENT_VNET="vnet-$3"
  DEPARTMENT_REMOTE_VNET="vnet-$4"
  DEPARTMENT_VNET_NAME=$(az resource show -g $RESOURCE_GRP --resource-type Microsoft.Network/virtualNetworks -n $DEPARTMENT_VNET --query id -o tsv)
  DEPARTMENT_REMOTE_VNET_NAME=$(az resource show -g $RESOURCE_GRP_REMOTE --resource-type Microsoft.Network/virtualNetworks -n $DEPARTMENT_REMOTE_VNET --query id -o tsv)


  echo "VNET Peering FOR $DEPARTMENT_VNET and $DEPARTMENT_REMOTE_VNET" 
  az network vnet peering create -g $RESOURCE_GRP \
                                 -n $DEPARTMENT_REMOTE_VNET"_peering" \
                                 --vnet-name $DEPARTMENT_VNET \
                                 --remote-vnet $DEPARTMENT_REMOTE_VNET_NAME \
                                 --allow-vnet-access

  echo "Reverse VNET Peering FOR $DEPARTMENT_REMOTE_VNET and $DEPARTMENT_VNET" 
  az network vnet peering create -g $RESOURCE_GRP_REMOTE \
                                 -n $DEPARTMENT_VNET"_peering" \
                                 --vnet-name $DEPARTMENT_REMOTE_VNET \
                                 --remote-vnet $DEPARTMENT_VNET_NAME \
                                 --allow-vnet-access
}

