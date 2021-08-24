$RESOURCE_GROUP_NAME= "rgcalico"
$CLUSTER_NAME="aks-calico-demo"

az aks check-acr --name $CLUSTER_NAME  --resource-group $RESOURCE_GROUP_NAME --acr msdemoregistry.azurecr.io

kubectl create namespace blockap
kubectl label namespace blockap location=blocknsap

kubectl create namespace blockapp2
kubectl label namespace blockapp2 location=blocknsapp2
<#Deploy Frontend, Frontendsidecar and backend#>
kubectl apply -f _azure/_aks_artifacts/calico/blockallRule/application/frontend.yaml
kubectl apply -f _azure/_aks_artifacts/calico/blockallRule/application/frontend_side.yaml

kubectl apply -f _azure/_aks_artifacts/calico/blockallRule/application/backend.yaml

<#Deploy Policy for "namespace= blockapp" #>
kubectl apply -f _azure/_aks_artifacts/calico/blockallRule/policy/blockall_frontendpolicy.yaml
kubectl apply -f _azure/_aks_artifacts/calico/blockallRule/policy/blockall_backendpolicy.yaml