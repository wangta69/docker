mariadb
kubectl apply -f .\pv.yaml
kubectl apply -f .\pvc.yaml
kubectl apply -f .\mariadb-statefulset.yaml

Dockers
php-fpm 
docker build . -t php-8-2-fpm
# docker build . -t php-8-2-fpm:1.0.0 // my-php-app 으로 이미지 생성

ssh-multiuser
```
docker build -t ssh-multiuser .
docker tag ssh-multiuser:latest pondol/ssh-multiuser:1.0.1
docker push pondol/ssh-multiuser:1.0.1
```

kubectl apply -f .\nginx-conf.yaml
kubectl apply -f .\deployment.yaml