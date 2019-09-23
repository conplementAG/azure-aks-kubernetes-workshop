# Update Strategies

[_Back to overview_](README.md)

## Ramped Deployment

_Release a new version on a rolling update fashion, one after the other_

```yaml
spec:
  replicas: 3
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 2 # how many pods we can add at a time
      maxUnavailable: 0 # maxUnavailable define how many pods can be unavailable during the rolling update
```

### Steps

- version 1 is serving traffic
- deploy version 2
- wait until all replicas are replaced with version 2

### Pros

- version is slowly released across instances
- convenient for stateful applications that can handle rebalancing of the data

### Cons

- rollout/rollback can take time
- supporting multiple APIs is hard
- no control over traffic
