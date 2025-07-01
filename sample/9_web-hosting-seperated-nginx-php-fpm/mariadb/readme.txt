
```
kubectl apply -f mariadb-pv.yaml
kubectl apply -f mariadb-pvc.yaml
kubectl apply -f mariadb-statefulset.yaml
```
```
kubectl exec -it <pod_name> -- /bin/bash
mariadb -uroot -p   
```