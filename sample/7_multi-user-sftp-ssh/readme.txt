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
docker build -t pondol/ssh-sftp-custom:latest -f ssh-sftp-custom.Dockerfile .
docker push pondol/ssh-sftp-custom:latest


docker build -t ssh-multiuser .
docker tag ssh-multiuser:latest pondol/ssh-multiuser:1.0.1
docker push pondol/ssh-multiuser:1.0.1
```

kubectl apply -f .\nginx-conf.yaml
kubectl apply -f .\deployment.yaml


사용자 수동 추가
```
kubectl exec -it ssh-server-XXXXX -- bash
adduser user3 // adduser --home /home/user3 user3
passwd user3
mkdir /home/user3 && chown user3:www-data /home/user3 && chmod 700 /home/user3
```


```
# cd /usr/share/nginx/html/
# composer create-project "laravel/laravel:^10.0" example-app
# chmod 757 $(find //usr/share/nginx/html/example-app/storage -type d)
```