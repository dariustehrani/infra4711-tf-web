# infra4711-packer
creates a base image for Azure based on ubuntu 18.04 LTS utilising Packer in a Azure DevOps Pipeline.

# status
[![Build Status](https://dev.azure.com/datehran/packer4711/_apis/build/status/dariustehrani.infra4711-packer?branchName=master)](https://dev.azure.com/datehran/packer4711/_build/latest?definitionId=5?branchName=master)

# ToDo
* more flexibel variables in .json
* instructions for MSI

# prerequisites
* az cli enabled machine
* Fork / Clone the repository
* customize the ubuntu1804.json according to your needs.

## Azure DevOps project
* Create a new project @ https://devops.azure.com
* Create a Service Connection (based on Service principal) in the Azure DevOps 
```
Project settings > Service connections > New service connection  
```
Select ```Azure Resource Manager```, Service Principal Authentication.  
here make sure to select "use full version of the service connection".
Keep this window open, please.

## Creating an Service Principal
You will need to create a SP Client ID and principal key in parallel. using azure cli the can be done as followed:

### get your subscription "id"
````
az account show
````

### create the SP
````
az ad sp create-for-rbac -n "packer-4711" --role contributor --scopes /subscriptions/YOURSUBSCRIPTIONIDGOESHERE
````

### create the SP
copy the app id into the "Service principal client ID" field and the key correspondingly into "Service principal key".
Use "verify connection" ...


# manual use / exploratory use (no pipeline)
* Azure Account set up.
* az cli tool installed.
* you can make use of the azure-setup.sh script below, to easily enable local packer development.
* for non-exploratory use make sure to used managed service identities. TODO LINK
* set up env vars see .packer_profile.sample TODO LINK
* customize the ubuntu1804.json according to your needs.
* packer validate ubuntu1804.json
* packer run ubuntu1804.json


# helpful resources

## changing region and/or location
lookup the corresponding azure source images in your region e.g.
```
#ubuntu
az vm image list --all -p Canonical -f UbuntuServer -s 18.04-LTS --location westeurope --all --output table

#windows
az vm image list --publisher MicrosoftWindowsServer --offer WindowsServer --location westeurope --all --output table

```

# bootstrapping packer on azure
https://github.com/hashicorp/packer/blob/master/contrib/azure-setup.sh

