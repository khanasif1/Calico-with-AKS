kubectl config set-context --current --namespace=app

kubectl get ns
kubectl get nodes
kubectl get ns -A

#kubectl delete deployment product-2 --namespace app2
#kubectl delete service backend --namespace app
#kubectl delete ns app

kubectl get deployment  -A
#kubectl delete deployment nginx --namespace app
#kubectl delete deployment nginx-2 --namespace app2
#kubectl delete deployment web --namespace app
#kubectl delete deployment product --namespace app
#kubectl delete deployment product-2 --namespace app2

kubectl get deployment  -A
kubectl get pod -o wide -A
kubectl get service -o wide -A
kubectl describe pod nginx-2-549dbdf9d9-l577h --namespace app2
kubectl describe deployment   product-2 --namespace app2

kubectl describe namespace app2

kubectl get NetworkPolicy -A -o wide
kubectl describe NetworkPolicy allow-nginx-product
kubectl describe NetworkPolicy blockallpolicy
kubectl describe NetworkPolicy allow-metrics-prom --namespace app

#kubectl delete networkpolicy blockallpolicy --namespace app
#kubectl delete networkpolicy  allow-nginx-product --namespace app
#kubectl delete networkpolicy  allow-nginx-product2 --namespace app

ku

#kubectl run nginxtest --image=nginx 
kubectl describe pod  nginx-6998bbffd7-xb9tn
kubectl describe pod  nginx-2-549dbdf9d9-l577h --namespace app2
#kubectl delete pod nginxtest

kubectl exec -it nginxtest  -- /bin/sh  
curl -i -X GET http://www.google.com

nginx-6998bbffd7-ks6dz  product-5456646588-99hvf   web-785d549876-9v2qd

kubectl exec -it nginx-6998bbffd7-mgbpg --namespace ap -- /bin/sh
kubectl exec -it nginx-2-549dbdf9d9-lphjt --namespace app2 -- /bin/sh


apt-get  update
apt-get install wget

wget -qO- --timeout=1  http://10.240.0.11                           #web

wget -qO- --timeout=1 http://10.240.0.6/api/product/GetMetadata     #product
wget -qO- --timeout=1 http://10.240.0.6/swagger/index.html          #product
wget -qO- --timeout=1 http://10.240.0.6.app/swagger/index.html      #product

wget -qO- --timeout=1 http://10.240.0.9/swagger/index.html          # product2
wget -qO- --timeout=1 http://10.240.0.9.app2/swagger/index.html     # product2

curl -i -X GET http://10.0.239.9.app                                  #nginx 
curl -i -X GET http://10.0.55.142.app2                                 #nginx2


curl -i -X GET http://frontend.ap
curl -i -X GET http://backend.app2