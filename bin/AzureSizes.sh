#!/usr/bin/env bash

# This script using a Service Principal account to generate that list

# Debug bash tags

set -o errexit
set -o nounset


# Making the Azure login

az login --service-principal --username $APP_ID --password $PASSWORD --tenant $TENANT_ID > /dev/null 2>&1


# Using JQ to make a magic with the return JSON

JQ_FILTER=".[] | [.name ,.memoryInMb ,.numberOfCores ,.resourceDiskSizeInMb] | @csv"


# Getting JSON with Subscriptions IDs

function GetAzureSubscriptions(){

    az account list | jq --raw-output ".[] | .id"
}


# Getting and cleaning a return JSON with Subscriptions IDs

function GetAzureSizes(){

    subscription=$1

    az account set --subscription $subscription

    subscription_name=$(az account show | jq --raw-output ".name")

    az vm list-sizes --location eastus2 | jq  --raw-output "$JQ_FILTER" | sed "s@^@\"$subscription_name\",@g"

}

# Looping with all the Subscriptions has the Service Principal can acess

for subscription in `GetAzureSubscriptions` ; do
    GetAzureSizes $subscription
done
