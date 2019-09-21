# Scheduling

[_Back to overview_](README.md)

## Resource Mangement

### Requests

Garantueed: only schedules if available on node

```yaml
requests:
  memory: "100Mi"
  cpu: "10m"
```

### Limits

Pods never goes above a limit

```yaml
# Must not be higher than maximum in limitrange
limits:
  # Not Compressable Unit: Killed if above a limit (evicted)
  memory: "200Mi"

  # Compressable Unit: Throttles if at limit
  cpu: "250m"
```
