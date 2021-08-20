kubectl config set-context --current --namespace=app

kubectl get ns
kubectl get nodes
kubectl get ns -A

#kubectl delete ns app2

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
#kubectl delete networkpolicy  allow-nginx-product2 --namespace ap

ku

#kubectl run nginxtest --image=nginx 
kubectl describe pod  nginx-6998bbffd7-xb9tn
kubectl describe pod  nginx-2-549dbdf9d9-l577h --namespace app2
#kubectl delete pod nginxtest

kubectl exec -it nginxtest  -- /bin/sh  
curl -i -X GET http://www.google.com

nginx-6998bbffd7-ks6dz  product-5456646588-99hvf   web-785d549876-9v2qd

kubectl exec -it frontend-57b4b965dc-99wr2 --namespace ap -- /bin/sh     #access pod frontend
kubectl exec -it backend-84f6f78f7f-cdhbx --namespace app2 -- /bin/sh    #access pod backend


apt-get  update
apt-get install wget

curl -i -X GET http://10.240.0.15                              #pod frontend 
curl -i -X GET http://10.0.38.123                                #svc frontend

curl -i -X GET http://10.240.0.26                               #pod backend
curl -i -X GET http://10.0.55.249                              #svc backend


curl -i -X GET http://frontend.ap
curl -i -X GET http://backend.app2