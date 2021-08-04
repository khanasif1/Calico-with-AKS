
#Login to Azure
az login

#Get credentials of your K8s cluster
az aks get-credentials --resource-group  k8rg --name demo-k8cluster

#check K8s config  value
kubectl  config view

#check current cluster in focus
kubectl config get-contexts

#switch default cluster 
kubectl config use-context akscoach-asif