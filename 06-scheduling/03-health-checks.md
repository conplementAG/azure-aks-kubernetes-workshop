# Scheduling

[_Back to overview_](README.md)

## Health Checks

If your app is not ready kubernetes should not send traffic to it, and also ensure that your app recovers.

### Readiness Probe

Your app is ready to serve traffic. Kubernetes will stop sending traffic to the pod, until the readiness probe passes again.

This can be usefull for preventing to serve traffic to an app during startup-time.

Kubernetes by will send traffic to a pod, when the process inside the container starts (e.g. `dotnet run` or `java -jar`). But at this time, your REST-Api is not yet fully ready to handle requests.

### Liveness Probes

Liveness Probes lets kuberntes know if your app is alive or dead.

If your app is alive, nothing will happen. If it is reported as dead, kubernetes will remove that instance and create a new one.

**Important:**
Remember to set the `initialDelaySeconds` correctly. Otherwise your pod will restart in a loop and never be ready.

### Types of Probes

- HTTP (2** or 3** -> Healthy)
- Command (Exitcode 0 -> Healthy)
- TCP (Connection Established on Port -> Healthy) (Example FTP-Server)

### Examples

**Command-Probe:**

```yaml
livenessProbe:
  exec:
    command:
      - cat
      - /tmp/healthy
  initialDelaySeconds: 5
  periodSeconds: 5
```

**HTTP-Probe:**

```yaml
livenessProbe:
  httpGet:
    path: /healthz
    port: 8080
    httpHeaders:
      - name: Custom-Header
        value: Awesome
  initialDelaySeconds: 3
  periodSeconds: 3
```

**TCP-Probe:**

```yaml
readinessProbe:
  tcpSocket:
    port: 8080
  initialDelaySeconds: 5
  periodSeconds: 10
```

## References

https://cloud.google.com/blog/products/gcp/kubernetes-best-practices-setting-up-health-checks-with-readiness-and-liveness-probes
