# Cluster Autoscaler

![Cluster Autoscaler](cluster-autoscaler.png "Cluster Autoscaler")

* Currently in preview and only recommended with a single node pool
* Currently the [parameters for autoscaling](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md#what-are-the-parameters-to-ca) can not be adjusted
* Like [Node Pools](node-autoscaling.md), the Cluster Autoscaler Feature requires the cluster nodes to have the VMSS type ( virtual machine scale sets).

Access the preview features in azure-cli:

```bash
az extension add --name aks-preview
```


Creating a cluster with the cluster autoscaler:

```bash
az aks create \
  ...
  --enable-cluster-autoscaler \
  --min-count 1 \
  --max-count 5
```

Update an existing cluster

```bash
az aks update \
  -n <name> \
  -g <resource-group> \
  --enable-cluster-autoscaler \
  --min-count 1 \
  --max-count 5
```
Disable cluster autoscaler

```bash
az aks update \
  ...
  --disable-cluster-autoscaler
```

## Example

1. Enable the cluster autoscaler for your existing cluster: `az aks update ...`
2. Create a lot of pods to force the cluster to autoscale

```
kubectl run --image=progrium/stress --replicas=100 stresstest -- --cpu 2 --io 1 --vm 2 --vm-bytes 128M --timeout 60s
```

3. Check Node Up-Scaling

```
kubectl top nodes
```

4. Clean Up

```
kubectl delete deployment stresstest
```

5. Check Node Down-Scaling

After 10 Minutes (see `scale-down-delay-after-add` Parameter)

```
kubectl top nodes
```


For more information see: https://docs.microsoft.com/en-us/azure/aks/cluster-autoscaler