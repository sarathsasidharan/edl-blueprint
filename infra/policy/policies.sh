#!/bin/bash


assign_policy(){

    POLICY_NAME=$1
    RESOURCE_GRP=$(az group show -n $2 --query id -o tsv)
    POLICY_ID=$3
    PARAM_PATH="policy/$4/azure_policy.parameters.json"
    
    echo "Creating Policy $POLICY_NAME for $2"

    az policy assignment create --name $POLICY_NAME \
                                --display-name $POLICY_NAME \
                                --scope $RESOURCE_GRP \
                                --policy $POLICY_ID \
                                --params $PARAM_PATH
}
