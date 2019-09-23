# Update Strategies

[_Back to overview_](README.md)

## Blue/Green Deployment

_Release a new version alongside the old version then switch traffic_

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-app
  labels:
    app: my-app
spec:
  type: NodePort
  ports:
    - name: http
      port: 8080
      targetPort: 8080

  # Note here that we match both the app and the version.
  # When switching traffic, we update the label "version" with
  # the appropriate value, ie: v2.0.0
  selector:
    app: my-app
    version: v1.0.0
```

### Steps

#### Single Service Scenario

- version 1 is serving traffic
- deploy version 2
- wait until version 2 is ready
- switch incoming traffic from version 1 to version 2
- shutdown version 1

This can either be done on `Service`-Level or on `Ingress`-Level when updating multiple services/ingress-rules at once.

### Pros

- instant rollout/rollback
- avoid versioning issue, change the entire cluster state in one go

### Cons

- requires double the resources
- proper test of the entire platform should be done before releasing to production
- handling stateful applications can be hard
