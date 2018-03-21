# AzureLists

The most easy way to get informations above all your subscriptions at once

## Prerequisites

* [Docker](https://docs.docker.com/install/)

* [Azure Service Principal](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest)

## Getting started

First of all, export your Azure Service Principal credentials to use this project.

```bash
export PASSWORD="XXXXXXX-XXXXXXX-XXXXXXXX-XXXXXXX"
export TENANT_ID="XXXXXXX-XXXXXXX-XXXXXXXX-XXXXXXX"
export APP_ID="XXXXXXX-XXXXXXX-XXXXXXXX-XXXXXXX"
```

## Create a environment
 
Run this command to build your structure

```bash
$ make setup 
```

## Getting the lists

All he lists avaliable to get at this time:

- Public IPs

export a CSV list with: Subscription, VM name, Public IP

```bash
$ make export-public-ips
```

- Azure VMs sizes

export a CSV list with: Subscription, VM size, Memory, Processor, Disk

```bash
$ make export-azure-sizes
```

```bash
$ make export-public-ips
```

- Azure VMs

export a CSV list with: Subscription, Resource Group, VM name, VM size

```bash
$ make export-vms
```

These command will read all the Subscriptons where the Service Principal has the access.

TIP: Create the Service Principal for this action only with READ permissions.

If you want only a specific information, use `awk` to filter. ex:

```bash
$ make export-public-ips | awk -F "," '{print $3}'
```

That's all :D