* mariadb phpfpm nginx laravel
https://velog.io/@poulet3794/%EB%8D%94-%EB%B3%B5%EC%9E%A1%ED%95%9C-%EC%84%A4%EC%A0%95-Laravel-PHP-%EB%8F%84%EC%BB%A4%ED%99%94-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8Part-1.-%EC%84%A4%EC%A0%95


docker build . -t php-8-2-fpm:1.0.0 // my-php-app 으로 이미지 생성



reset
kubectl delete pod nginx-phpfpm
kubectl delete configmap nginx-config

kubectl apply -f .\nginx-conf.yaml
kubectl apply -f .\pod.yaml
kubectl port-forward nginx-phpfpm 8888:80

kubectl exec --stdin --tty nginx-phpfpm --container nginx -- /bin/bash
kubectl exec --stdin --tty nginx-phpfpm --container phpfpm82 -- /bin/bash
cd /usr/share/nginx/html

vi index.php
```
<?php
phpinfo()
?>
```

mariadb

https://velog.io/@imsooyeon/k8s-mariadb-pod-%EC%83%9D%EC%84%B1%ED%95%98%EA%B8%B0

kubectl create -f mariadb-pv.yaml
kubectl create -f mariadb-pvc.yaml
kubectl create -f mariadb-secret.yaml
kubectl create -f mariadb-configmap.yaml
kubectl create -f mariadb-svc.yaml
kubectl create -f mariadb-deployment.yaml



apt-get update && apt-get install vim && alias "ll"="ls -al"


kubectl exec --stdin --tty nginx-phpfpm --container phpfpm82 -- /bin/bash // pod의 default container의 콘솔 접근
kubectl exec -i -t nginx-phpfpm --container nginx -- /bin/bash // 1개 이상의 container가 pod 내에 있을 경우 각각의 container 접근법

kubectl apply -f .\nginx-conf.yaml
kubectl apply -f .\pod.yaml
kubectl port-forward nginx-phpfpm 8888:80

browser: 127.0.0.1:8888



    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm inddex.php
    }
/usr/share/nginx/html


location ~ \.php$ {
        root           html;
        fastcgi_pass   php:9000;
        fastcgi_index  index.php;
        fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
        include        fastcgi_params;
    }




        access_log  /var/log/nginx/host.access.log  main;
    error_log   /var/log/nginx/host.error.log main;




    composer create-project "laravel/laravel:^10.0" example-app