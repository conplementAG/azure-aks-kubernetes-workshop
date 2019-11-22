## BASIC RESOURCES
 
kubectl get ns
kubectl get namespaces
kubectl get namespace
 
kubectl get pods
kubectl get services -o wide
kubectl get deployments
 
kubectl get pods,services,deployments -o yaml



kubectl get nodes
 
## INFORMATION
 
kubectl describe pods, services, deployments
 
kubectl logs <POD_NAME> -f
 
kubectl apply -f <directory or file.yaml>
 
kubectl top nodes
kubectl top pods
 
## DEBUGGING
 
kubectl port-forward svc/<SERVICE_NAME> <LOCAL_PORT>:<REMOTE_PORT>
 
kubectl exec -it <POD_NAME> -- /bin/sh
kubectl exec -it <POD_NAME> -- /bin/bash
