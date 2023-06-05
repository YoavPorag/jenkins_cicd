#/bin/bash

kubectl apply -f /home/yporagpa/Learning/bynet_tasks/kubernetes-jenkins/namespace.yaml
kubectl apply -f /home/yporagpa/Learning/bynet_tasks/kubernetes-jenkins/volume.yaml
kubectl apply -f /home/yporagpa/Learning/bynet_tasks/kubernetes-jenkins/deployment.yaml
kubectl apply -f /home/yporagpa/Learning/bynet_tasks/kubernetes-jenkins/serviceAccount.yaml
kubectl apply -f /home/yporagpa/Learning/bynet_tasks/kubernetes-jenkins/service.yaml