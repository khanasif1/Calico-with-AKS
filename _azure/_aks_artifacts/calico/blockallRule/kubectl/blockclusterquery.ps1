kubectl get deployment  -A
kubectl get deployment  -A
kubectl get pod -o wide -A
kubectl get service -o wide -A
kubectl get NetworkPolicy -A -o wide

#kubectl delete networkpolicy blockallpolicy --namespace blockap
#kubectl delete networkpolicy blockallpolicy --namespace blockapp2
 

kubectl exec -it blockfrontend-597986fc58-k5gwm --namespace blockap -- /bin/sh        #access pod frontend
kubectl exec -it blockfrontend-side-cd5fc6456-5wqmw --namespace blockap -- /bin/sh   #access pod frontend-side
kubectl exec -it blockbackend-9b86d7c44-2qxnw --namespace blockapp2 -- /bin/sh       #access pod backend



curl -i -X GET http://10.240.0.21                              #pod frontend 
curl -i -X GET http://10.240.0.23                              #pod frontend-side 
curl -i -X GET http://10.0.140.96                               #svc frontend
curl -i -X GET http://10.0.180.46                                #svc frontend-side

curl -i -X GET http://10.240.0.28                               #pod backend
curl -i -X GET http://10.0.79.226                              #svc backend


curl -i -X GET http://blockfrontend.blockap
curl -i -X GET http://blockfrontend-side.blockap
curl -i -X GET http://blockbackend.blockapp2