https://danielrotter.at/2023/05/30/configuring-nginx-with-php-fpm-in-kubernetes-and-the-file-not-found-error.html#:~:text=Afterwards%20I%20created%20a%20YAML%20file%20to%20describe%20a%20Kubernetes%20deployment.

docker 로 구성 법 : https://velog.io/@natae/PHP-php-fpm-nginx-docker-build-and-play


step 1 : Dockkerfile 생성
```
docker build . -t php-fpm-8.2:1.0.0 // php-nginx 으로 이미지 생성
```

step 2 : configmap.yaml 생성
```
kubectl create -f ./configmap.yaml
```

step3 : /deployment-nginx.yaml
```
kubectl create -f ./deployment-nginx.yaml
```


kubectl describe pod {POD NAME}
kubectl logs [pod name]