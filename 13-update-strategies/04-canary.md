# Update Strategies

[_Back to overview_](README.md)

## Canary Releases

_Release a new version to a subset of users, then proceed to a full rollout_

### Native Implementation (Replica-Count)

4 Pods (75% vs. 25%)

```yaml
spec:
  replicas: 3
```

```yaml
spec:
  replicas: 1
```

#### Steps

10 replicas of version 1 is serving traffic
deploy 1 replicas version 2 (meaning ~10% of traffic)
wait enought time to confirm that version 2 is stable and not throwing unexpected errors
scale up version 2 replicas to 10
wait until all instances are ready
shutdown version 1

### Implementation with Nginx-Ingress-Controller (Weights)

See [Canaray-Annotations on Nginx-Ingress-Controller](https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/annotations/#canary) (`nginx.ingress.kubernetes.io/canary-weight`).

#### Steps

- version 1 is serving traffic
- deploy version 2
- create a new "canary" ingress with traffic splitting enabled
- wait enought time to confirm that version 2 is stable and not throwing unexpected errors
- delete the canary ingress
- point the main application ingress to send traffic to version 2
- shutdown version 1

### Pros

- version released for a subset of users
- convenient for error rate and performance monitoring
- fast rollback

### Cons

- slow rollout
- fine tuned traffic distribution can be expensive (99% A/ 1%B = 99 pod A, 1 pod B)
