# Update Strategies

[_Back to overview_](README.md)

## Recreate Strategy

_Terminate the old version and release the new one_

```yaml
spec:
  replicas: 3
  strategy:
    type: Recreate
```

### Steps

- version 1 is service traffic
- delete version 1
- deploy version 2
- wait until all replicas are ready

### Pros

- application state entirely renewed

### Cons

- downtime that depends on both shutdown and boot duration of the application
