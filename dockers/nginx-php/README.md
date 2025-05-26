https://github.com/sebinxavi/kubernetes-nginx-phpfpm-app


kubectl create -f ./phpfpm-deployment.yaml
kubectl create -f ./phpfpm-clusterip.yaml
kubectl create -f ./nginx-deployment.yaml
kubectl create -f ./nginx-nodeport.yaml


kubectl port-forward [pod name] 8888:8080