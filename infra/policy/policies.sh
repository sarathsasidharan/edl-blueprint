#!/bin/bash


assign_policy(){

    POLICY_NAME=$1
    RESOURCE_GRP=$(az group show -n $2 --query id -o tsv)
    POLICY_ID=$3
    PARAM_PATH="policy/$POLICY_NAME/assignment/$4"

    
    
    echo "Creating Policy $POLICY_NAME for $2"

    az policy assignment create --name $POLICY_NAME \
                                --display-name $POLICY_NAME \
                                --scope $RESOURCE_GRP \
                                --policy $POLICY_ID \
                                --params $PARAM_PATH
}

create_policy(){

    POLICY_NAME=$1
    DISPLAY_NAME=$2
    DESCRIPTION=$3
    RULES_PATH=policy/$POLICY_NAME/definition/$POLICY_NAME.rules.json
    PARAM_PATH=policy/$POLICY_NAME/definition/$POLICY_NAME.parameters.json
    
    echo "Creating new Custom Policy $POLICY_NAME"
    az policy definition create --name $POLICY_NAME \
                          --display-name $DISPLAY_NAME \
                          --description $DESCRIPTION \
                          --rules $RULES_PATH \
                          --params $PARAM_PATH \
                          --mode All
}