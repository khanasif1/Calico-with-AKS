$RESOURCE_GROUP_NAME= "rgcalico"
$CLUSTER_NAME="aks-calico-demo"
$VNET="calicoVnet"
$SUBNET="calicoSubnet"
$ACR = "msdemoregistry"
#az account list-locations -o table
$LOCATION="australiaeast"

# Create a resource group
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

# Create a virtual network and subnet
az network vnet create `
    --resource-group $RESOURCE_GROUP_NAME `
    --name  $VNET `
    --address-prefixes 10.0.0.0/8 `
    --subnet-name $SUBNET `
    --subnet-prefix 10.240.0.0/16

# Create a service principal and read in the application ID
$SP=$(az ad sp create-for-rbac --output json)
<#
{
  "appId": "dcbef188-b819-4235-9dfe-9ef99028f13c",
  "displayName": "azure-cli-2021-08-05-03-24-08",
  "name": "http://azure-cli-2021-08-05-03-24-08",
  "password": "o1LquzFxhHdneXP2kDrcNDo8V_ygE2OmM7",
  "tenant": "72f988bf-86f1-41af-91ab-2d7cd011db47"
}
#>
$SP_ID = ($SP | ConvertFrom-Json).appId
$SP_PASSWORD = ($SP | ConvertFrom-Json).password


# Wait 15 seconds to make sure that service principal has propagated
echo "Waiting for service principal to propagate..."
sleep 15


# Get the virtual network resource ID
$VNET_ID=$(az network vnet show --resource-group $RESOURCE_GROUP_NAME --name $VNET --query id -o tsv)

# Assign the service principal Contributor permissions to the virtual network resource
az role assignment create --assignee $SP_ID --scope $VNET_ID --role Contributor

<#
{
  "canDelegate": null,
  "condition": null,
  "conditionVersion": null,
  "description": null,
  "id": "/subscriptions/9907fc36-386a-48e6-9b00-0470d5f7cab7/resourceGroups/rgcalico/providers/Microsoft.Network/virtualNetworks/calicoVnet/providers/Microsoft.Authorization/roleAssignments/c74ad3b3-14f5-433d-8244-a13e483feb2e",
  "name": "c74ad3b3-14f5-433d-8244-a13e483feb2e",
  "principalId": "d6c02f24-30e8-4dd8-96ba-7c45e95788d9",
  "principalType": "ServicePrincipal",
  "resourceGroup": "rgcalico",
  "roleDefinitionId": "/subscriptions/9907fc36-386a-48e6-9b00-0470d5f7cab7/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c",
  "scope": "/subscriptions/9907fc36-386a-48e6-9b00-0470d5f7cab7/resourceGroups/rgcalico/providers/Microsoft.Network/virtualNetworks/calicoVnet",
  "type": "Microsoft.Authorization/roleAssignments"
}
#>


# Get the virtual network subnet resource ID
$SUBNET_ID=$(az network vnet subnet show --resource-group $RESOURCE_GROUP_NAME --vnet-name $VNET --name $SUBNET --query id -o tsv)


# AKS available version in the region
az aks get-versions --location $LOCATION --output table

# Deploy AKS
az aks create `
    --resource-group $RESOURCE_GROUP_NAME   `
    --name $CLUSTER_NAME `
    --node-count 1 `
    --generate-ssh-keys `
    --service-cidr 10.0.0.0/16 `
    --dns-service-ip 10.0.0.10 `
    --docker-bridge-address 172.17.0.1/16 `
    --vnet-subnet-id $SUBNET_ID `
    --service-principal $SP_ID `
    --client-secret $SP_PASSWORD `
    --vm-set-type VirtualMachineScaleSets `
    --kubernetes-version 1.21.2 `
    --network-plugin azure `
    --network-policy calico `
    --attach-acr $ACR

