https://matthewpalmer.net/kubernetes-app-developer/articles/php-fpm-nginx-kubernetes.html


docker build . -t my-php-app:1.0.0 // my-php-app 으로 이미지 생성

kubectl create -f configmap.yaml
kubectl create -f pod.yaml
kubectl port-forward phpfpm-nginx 8888:80


kubectl exec --stdin --tty phpfpm-nginx-example -- /bin/bash // pod의 default container의 콘솔 접근
kubectl exec -i -t phpfpm-nginx-example --container nginx -- /bin/bash // 1개 이상의 container가 pod 내에 있을 경우 각각의 container 접근법


kubectl delete pod phpfpm-nginx-example
kubectl create -f .\pod.yaml

apt-get update & apt-get install vim & alias "ll"="ls -al"