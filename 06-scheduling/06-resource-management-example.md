# Scheduling

[_Back to overview_](README.md)

## Example

Step 1: Check the current kubernetes resource usage

```bash
kubectl top nodes
kubectl top pods
kubectl describe resourcequota
```

Step 2: Check recommendations with kube-advisor

```bash
kubectl run --rm -i -t kube-advisor --image=mcr.microsoft.com/aks/kubeadvisor --restart=Never
```

Step 3: Activate Health Checks and Resource-Management in the demo application

Enable the health-checks and resource quotas via helm parameters, see [deployment.yaml in helm chart](https://github.com/conplementAG/teams-demo-app/blob/master/deployment/example-application/charts/Backend/templates/deployment.yaml).

```bash
helm upgrade example-application-release example-application --set global.HealthChecks.enabled=true,global.ResourceManagement.enabled=true
```

Step 4: Consume more CPU than allowed

Access your application via the external ip

```bash
kubectl get svc
```

Generate some CPU load in the backend pod:

```bash
curl -X POST "http://<YOUR IP>/api/load/cpu?percentage=100&durationInSeconds=120" -H "accept: */*"
# this is lso possible via swagger under http://<YOUR IP>/swagger
```

The pod should not be restarted but throttled.

After increasing the CPU load check the resource usage and ensure that your pod has not be restarted.

```bash
kubectl top pods
kubectl get pods
```

Step 5: Simulate a memory leak...

... by decreasing the memory limit and requests in the helm chart + update.

```yaml
requests:
  memory: "10Mi"
  cpu: "10m"

# Limits: Pods never goes above a limit
# Must not be higher than maximum in limitrange
limits:
  # Not Compressable Unit: Killed if above a limit (evicted)
  memory: "20Mi"

  # Compressable Unit: Throttles if at limit
  cpu: "250m"
```

**Hint: You might need to delete the resource-quotas and limitrange defintions from the helm chart to make this adjustment**

```bash
helm upgrade example-application-release example-application --set global.HealthChecks.enabled=true,global.ResourceManagement.enabled=true
```

Check if the pods gets killed by default (OOMKilled), because it needs more memory (during startup time).

```bash
kubectl get pods --watch
```
