* 초간단 nginx 띄우기
https://velog.io/@hsh_124/%EC%BF%A0%EB%B2%84%EB%84%A4%ED%8B%B0%EC%8A%A4-%EC%96%B4%ED%94%8C%EB%A6%AC%EC%BC%80%EC%9D%B4%EC%85%98-%EC%BB%A4%EC%8A%A4%ED%84%B0%EB%A7%88%EC%9D%B4%EC%A7%95

reset
kubectl delete pod nginx-phpfpm
kubectl delete configmap nginx-config

kubectl create -f .\nginx-conf.yaml
kubectl create -f .\pod.yaml
kubectl port-forward nginx-phpfpm 8888:80

kubectl exec --stdin --tty nginx-phpfpm --container nginx -- /bin/bash
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

kubectl create -f .\nginx-conf.yaml
kubectl create -f .\nginx.yaml
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