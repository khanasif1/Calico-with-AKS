$RESOURCE_GROUP_NAME= "rgcalico"
$CLUSTER_NAME="aks-calico-demo"

az aks check-acr --name $CLUSTER_NAME  --resource-group $RESOURCE_GROUP_NAME --acr msdemoregistry.azurecr.io

kubectl apply -f _azure/_aks_artifacts/yaml/application/web.yaml
kubectl apply -f _azure/_aks_artifacts/yaml/application/product.yaml

kubectl apply -f _azure/_aks_artifacts/yaml/policy/productpolicy.yaml
