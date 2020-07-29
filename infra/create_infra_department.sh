#!/bin/bash
# This script creates the resources needed for finance department 

#Declare Script Paths
# "config/azure_finance.config"
CONFIG_PATH=$1
LOGIN_TEARDOWN_PATH="login/login.sh"
NETWORK_VNET_PATH="network/create_network.sh"
POLICY_PATH="policy/policies.sh"


#Import Functions needed to create Infra.
source $CONFIG_PATH
source $LOGIN_TEARDOWN_PATH
source $NETWORK_VNET_PATH
source $RESOURCE_GROUP_PATH
source $POLICY_PATH

azlogin

create_subnet $RG $VNET $SUBNET $SUBNET_RANGE


