https://matthewpalmer.net/kubernetes-app-developer/articles/php-fpm-nginx-kubernetes.html


docker build . -t my-php-app:1.0.0 // my-php-app 으로 이미지 생성

kubectl create -f configmap.yaml
kubectl create -f pod.yaml
kubectl port-forward phpfpm-nginx-example 8888:80