$RESOURCE_GROUP_NAME= "rgcalico"
$CLUSTER_NAME="aks-calico-demo"

az aks check-acr --name $CLUSTER_NAME  --resource-group $RESOURCE_GROUP_NAME --acr msdemoregistry.azurecr.io

kubectl create namespace ap
kubectl label namespace ap location=nsap

kubectl create namespace app2
kubectl label namespace app2 location=nsapp2
<#Deploy NGINX#>
kubectl apply -f _azure/_aks_artifacts/calico/namespaceRule/application/frontend.yaml
kubectl apply -f _azure/_aks_artifacts/calico/namespaceRule/application/frontend_side.yaml

kubectl apply -f _azure/_aks_artifacts/calico/namespaceRule/application/backend.yaml

<#Deploy Policy#>
kubectl apply -f _azure/_aks_artifacts/calico/namespaceRule/policy/allow_nginx_product.yaml
kubectl apply -f _azure/_aks_artifacts/calico/namespaceRule/policy/allow_cross_ns_pod.yaml

