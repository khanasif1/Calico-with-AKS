$RESOURCE_GROUP_NAME= "rgcalico"
$CLUSTER_NAME="aks-calico-demo"

az aks check-acr --name $CLUSTER_NAME  --resource-group $RESOURCE_GROUP_NAME --acr msdemoregistry.azurecr.io

<#Deploy NGINX#>
kubectl run nginxpod --image=nginx --namespace=app
kubectl apply -f _azure/_aks_artifacts/yaml/application/nginx.yaml

<#Deploy App#>
kubectl apply -f _azure/_aks_artifacts/yaml/application/web.yaml
kubectl apply -f _azure/_aks_artifacts/yaml/application/product.yaml
kubectl apply -f _azure/_aks_artifacts/yaml/application/product2.yaml

<#Deploy Policy#>
kubectl apply -f _azure/_aks_artifacts/yaml/policy/blockall_productpolicy.yaml
kubectl apply -f _azure/_aks_artifacts/yaml/policy/allow_nginx_product.yaml
kubectl apply -f _azure/_aks_artifacts/yaml/policy/allow_cross_ns_pod.yaml
