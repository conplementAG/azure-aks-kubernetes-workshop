# Autoscaling

[_Back to overview_](README.md)

## Node Pools

- Node Pools enables you to have multiple types of nodes to back up your kubernetes cluster nodes.
- Examples: GPU, Fast disc access, etc.
- One-Way Feature that can be enabled for a subscription (`az feature register ...`)
- You have to enable this feature before cluster creation
- Like [Cluster Autoscaler](node-autoscaling.md), the Node Pools Feature requires the cluster nodes to have the VMSS type ( virtual machine scale sets).

You can specify different VM-types with Node Pools:

```bash
az aks nodepool add \
    --resource-group myResourceGroup \
    --cluster-name myAKSCluster \
    --name gpunodepool \
    --node-count 1 \
    --node-vm-size Standard_NC6 \
    --no-wait
```

For more information see: https://docs.microsoft.com/en-us/azure/aks/use-multiple-node-pools
