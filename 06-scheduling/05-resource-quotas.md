# Scheduling

[_Back to overview_](README.md)

## Resource Quotas

Enfore Requests and Limits for Pods within a namespace.

- `limits.cpu`: Across all pods in a non-terminal state, the sum of CPU limits cannot exceed this value.
- `limits.memory`: Across all pods in a non-terminal state, the sum of memory limits cannot exceed this value.
- `requests.cpu`: Across all pods in a non-terminal state, the sum of CPU requests cannot exceed this value.
- `requests.memory`: Across all pods in a non-terminal state, the sum of memory requests cannot exceed this value.

Example Resource Quotas:

```yaml
apiVersion: v1
kind: List
items:
  - apiVersion: v1
    kind: ResourceQuota
    metadata:
      name: pods-high
    spec:
      hard:
        cpu: "1000"
        memory: 200Gi
        pods: "10"
      scopeSelector:
        matchExpressions:
          - operator: In
            scopeName: PriorityClass
            values: ["high"]
  - apiVersion: v1
    kind: ResourceQuota
    metadata:
      name: pods-medium
    spec:
      hard:
        cpu: "10"
        memory: 20Gi
        pods: "10"
      scopeSelector:
        matchExpressions:
          - operator: In
            scopeName: PriorityClass
            values: ["medium"]
  - apiVersion: v1
    kind: ResourceQuota
    metadata:
      name: pods-low
    spec:
      hard:
        cpu: "5"
        memory: 10Gi
        pods: "10"
      scopeSelector:
        matchExpressions:
          - operator: In
            scopeName: PriorityClass
            values: ["low"]
```

Example Pod:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: high-priority
spec:
  containers:
    - name: high-priority
      image: ubuntu
      command: ["/bin/sh"]
      args: ["-c", "while true; do echo hello; sleep 10;done"]
      resources:
        requests:
          memory: "10Gi"
          cpu: "500m"
        limits:
          memory: "10Gi"
          cpu: "500m"
  priorityClassName: high
```

## References

https://kubernetes.io/docs/concepts/policy/resource-quotas/
