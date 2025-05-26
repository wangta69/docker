https://blog.cloudsigma.com/deploy-a-php-application-on-a-kubernetes-cluster-with-ubuntu-18-04/


kubectl create -f ./php_fpm_service.yaml
kubectl create -f ./nginx_service.yaml
kubectl create -f ./php_deployment.yaml