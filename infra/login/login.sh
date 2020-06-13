#!/bin/sh
# Login and teardown scripts

#Function to Login
azlogin() {
    echo "Login to Azure"
    az login
}

shutdown() {
    MARKED_RESOURCE_GROUP=$1
    echo "Shutting down ETL Infra , decomissioning resources"
    az group delete -n $MARKED_RESOURCE_GROUP
}
