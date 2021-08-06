$RESOURCE_GROUP_NAME= "rgcalico"
$CLUSTER_NAME="aks-calico-demo"

#Login to Azure
az login

#Get credentials of your K8s cluster
az aks get-credentials --resource-group $RESOURCE_GROUP_NAME  --name $CLUSTER_NAME

#check K8s config  value
kubectl  config view

#check current cluster in focus
kubectl config get-contexts

#switch default cluster 
kubectl config use-context $CLUSTER_NAME