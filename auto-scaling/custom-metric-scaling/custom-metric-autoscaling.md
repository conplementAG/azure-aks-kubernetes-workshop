# Custom Metric Autoscaling

## General Introduction

For scaling pods depending on custom metrics you can also use the Horizontal Pod Autoscaler (HPA).

To make your custom metric available to the HPA, you need to make them available in the API Server.
This can be done by

1. Collecting your custom metrics with [Prometheus](https://prometheus.io/)
2. Attaching your prometheus metrics to the Metrics Server with [Prometheus Adapter](https://github.com/DirectXMan12/
k8s-prometheus-adapter)
3. Configure your HPA to use the custom metric for scaling

![custom-metric-scaling.png](custom metric scaling)

For more information see: https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/#autoscaling-on-multiple-metrics-and-custom-metrics

## Example

### 1. Infrastructure Setup

#### Prometheus Operator

```bash
# TODO: Try out with helm chart
kubectl apply -f custom-metric-scaling
```

#### Prometheus Adapter

```bash
helm install -f metric-config.yaml --name prometheus-adapter-release stable/prometheus-adapter
```

### Pod Metrics

helm install -f metric-config.yaml --name prometheus-adapter-release stable/prometheus-adapter

Example:

```yaml
type: Pods
pods:
  metric:
    name: packets-per-second
  target:
    type: AverageValue
    averageValue: 1k
```

## External Metrics
See: https://github.com/Azure/azure-k8s-metrics-adapter implemented with https://github.com/kubernetes-incubator/custom-metrics-apiserver

https://github.com/DirectXMan12/k8s-prometheus-adapter/blob/master/docs/walkthrough.md