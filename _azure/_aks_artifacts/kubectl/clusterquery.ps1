kubectl config set-context --current --namespace=app

kubectl get ns
kubectl get nodes
kubectl get ns

kubectl get deployment
kubectl get pod -o wide -A
kubectl describe pod nginx-6998bbffd7-ks6dz

kubectl get NetworkPolicy -A -o wide
kubectl describe NetworkPolicy allow-nginx-product
kubectl describe NetworkPolicy blockallpolicy

#kubectl delete networkpolicy blockallpolicy --namespace app
#kubectl delete networkpolicy  allow-nginx-product --namespace app

kubectl create namespace policy

#kubectl run nginxtest --image=nginx 
kubectl describe pod  web-5d56b796f-sgkr7
kubectl delete pod nginxtest

kubectl exec -it nginxtest  -- /bin/sh  
curl -i -X GET http://www.google.com

nginx-6998bbffd7-ks6dz  product-5456646588-99hvf   web-785d549876-9v2qd

kubectl exec -it nginx-6998bbffd7-ks6dz -- /bin/sh
kubectl exec -it web-785d549876-9v2qd -- /bin/sh
kubectl exec -it product-5456646588-99hvf -- /bin/sh

apt-get  update
apt-get install wget

wget -qO- --timeout=5 http://localhost

wget -qO- --timeout=2 http://10.240.0.7   #nginx
wget -qO- --timeout=2  http://10.240.0.17  #web

wget -qO- --timeout=2 http://10.240.0.13/api/product/GetMetadata #product
wget -qO- --timeout=2 http://10.240.0.13/swagger/index.html
