https://medium.com/@ravipatel.it/deploying-mariadb-on-kubernetes-a-step-by-step-guide-ec2959cc9b1d


kubectl apply -f pv.yaml
kubectl apply -f pvc.yaml
kubectl apply -f mariadb-statefulset.yaml

kubectl exec -it <pod_name> -- /bin/bash

mariadb -uroot -p   