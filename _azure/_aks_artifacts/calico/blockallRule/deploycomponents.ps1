$RESOURCE_GROUP_NAME= "rgcalico"
$CLUSTER_NAME="aks-calico-demo"

az aks check-acr --name $CLUSTER_NAME  --resource-group $RESOURCE_GROUP_NAME --acr msdemoregistry.azurecr.io

kubectl create namespace blockap
kubectl label namespace blockap location=nsap

kubectl create namespace blockapp2
kubectl label namespace blockapp2 location=nsapp2
<#Deploy NGINX#>
kubectl apply -f _azure/_aks_artifacts/calico/namespaceRule/application/frontend.yaml
kubectl apply -f _azure/_aks_artifacts/calico/namespaceRule/application/frontend_side.yaml

kubectl apply -f _azure/_aks_artifacts/calico/namespaceRule/application/backend.yaml

<#Deploy Policy#>
kubectl apply -f _azure/_aks_artifacts/calico/namespaceRule/policy/blockall_productpolicy.yaml