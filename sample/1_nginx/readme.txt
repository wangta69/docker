* 초간단 nginx 띄우기

kubectl create -f .\nginx.yaml
kubectl port-forward myfirstweb 8888:80

browser: 127.0.0.1:8888



동일 container로 마운트를 시키거나 
service로 맵핑을 시켜야 한다.