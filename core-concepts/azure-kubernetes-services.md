# Azure Kubernetes Service

Managed kubernetes from Azure comes with some additional components, which will be described below.

The base for kubernetes on Azure is aks-engine, which is based on acs-engine:

https://github.com/Azure/aks-engine
https://github.com/Azure/aks-engine/tree/master/parts/k8s

If you look at the default pods in the kube-system namespace you will find some pods that are not listed in the default system-components section:

```
> kubectl get pods -n kube-system

azure-cni-networkmonitor-7xk58
azure-cni-networkmonitor-dbbjh
azure-cni-networkmonitor-qh2xr
azure-ip-masq-agent-5lvgq
azure-ip-masq-agent-6g565
azure-ip-masq-agent-x96v4
coredns-67fd67489b-bfzgt
coredns-67fd67489b-nbhgr
coredns-autoscaler-f654c64fd-tjfcb
heapster-6d879b9dc8-mzqwv
kube-proxy-2lbdd
kube-proxy-plgrc
kube-proxy-xbdmr
kubernetes-dashboard-69bd89c8f7-7nfcz
metrics-server-67c75dbf7-jxnjp
omsagent-2qtrm
omsagent-qsdds
omsagent-rkbzx
omsagent-rs-59bdc565b8-5n4rk
tiller-deploy-7b659b7fbd-sr8l5
tunnelfront-bcb7f4d6f-j8w99
```

### azure-cni-networkmonitor

[Github azure-cni-networkmonitor](https://github.com/Azure/azure-container-networking)

Kubernetes CNI Implementation (Container Network Interface) for AKS.

The Azure's CNI network monitor is a service that monitors and fixes any discrepancy in the layer 2 rules that are required to connect containers to Azure's Vnet.

### azure-ip-masq-agent

Networking code from kubelet to controll iptables, CIDRs.

This agent solves the problem of configuring the CIDR ranges for non-masquerade in a cluster (via iptables rules)

[Github ip-masq-agent](https://github.com/kubernetes-incubator/ip-masq-agent)

### coredns

CoreDNS replaces kube-dns. It has a better performance than kube-dns, espacially with managing lots of containers, see [this blog post](https://coredns.io/2018/11/27/cluster-dns-coredns-vs-kube-dns/).

### heapster

Heapster is a performance monitoring and metrics collection system compatible with Kubernetes.
**Depricated** - will be closed in the future. Will be replaced by metrics-server (core-metrics) and prometheus (general monitoring). [Github Heapster](https://github.com/kubernetes-retired/heapster).

### metrics-server

Metrics Server is a cluster-wide aggregator of resource usage data. Runs on a single instance per cluster and aggregates the metrics from kubelet and exposes them to the API server.

### General Monitoring overview in acs-engine (AKS)

https://github.com/Azure/acs-engine/blob/master/docs/kubernetes/monitoring.md