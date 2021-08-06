kubectl config set-context --current --namespace=app

kubectl get ns
kubectl get nodes
kubectl get ns

kubectl get deployment
kubectl get pod -o wide

kubectl get NetworkPolicy -A -o wide

kubectl delete networkpolicy  product-policy


kubectl run nginxtest --image=nginx 

kubectl exec -it nginxtest  -- /bin/sh  
curl -i -X GET http://www.google.com


kubectl exec -it nginxtest -- /bin/sh
wget -qO- --timeout=5 http://localhost

wget -qO- --timeout=2  http://10.240.0.31

wget -qO- --timeout=2 http://10.240.0.18/api/product/GetMetadata
wget -qO- --timeout=2 http://10.240.0.18/swagger/index.html
