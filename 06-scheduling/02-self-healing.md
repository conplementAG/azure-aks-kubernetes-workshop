# Scheduling

[_Back to overview_](README.md)

## Self Healing Mechanisms

To always ensure a certain number of running pods, kubernetes provides a `replicaset` resource.
This defines a certain number of pod-replicas running at a given time. If a pod is running will be determined by its health-checks.

### Replicaset

You can directly create a replicaset for your pods or create a higher-level deployment, which will manage/update the replicaset for you.

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:
  # modify replicas according to your case
  replicas: 3
  selector:
    matchLabels:
      tier: frontend
  template:
    metadata:
      labels:
        tier: frontend
    spec:
      containers:
        - name: php-redis
          image: gcr.io/google_samples/gb-frontend:v3
```

### Deployment

A deployment declares some metadata around a pod. One specification is the number of replicas that should be running at a given time. This will create a replicaset for you.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx:1.7.9
          ports:
            - containerPort: 80
```
