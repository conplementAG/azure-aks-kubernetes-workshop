# Autoscaling

[_Back to overview_](README.md)

## Virtual Node Autoscaling

Azure AKS provides you the option to either run on dedicated VMs or on virtual VMs.
Virtual VM can be usefull for short running workloads or to temporarly compensate high load.

Under the hood, this uses Azure Container Instances (ACI) for running the workload.

If your cluster is properly prepared for virtual nodes you can you can specify to run a deployment on a virtual node like:

```yaml
nodeSelector:
  kubernetes.io/role: agent
  beta.kubernetes.io/os: linux
  type: virtual-kubelet
```

### References

A comprehensive tutorial can be found here:

- https://docs.microsoft.com/de-de/azure/aks/virtual-nodes-portal
