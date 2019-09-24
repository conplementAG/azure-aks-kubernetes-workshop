# Basic Concepts

[_Back to overview_](README.md)

## Operational Best Practices

### Isolation

When developing complex systems that should last for long, you should consider the following two ways of isolation.

#### Physical Isolation

Implement physical Isolation with multiple cluster instances

![Physical Cluster Isolation](images/physical-isolation.png)

#### Logical Isolation

![Logical Cluster Isolation](images/logical-isolation.png)

Implement logical isolation with namespaces of teams and environments

To manage multiple teams/projects within one cluster, you should consider the following topics:

- Scheduling: Resource Quotas
- Networking: Network Policies
- Authentication and Authorization: RBAC
- Container Level Isolation
- Check for kube-advisor for recommendations
- Don't use default namespace for production

- Advantages of logical isolation: Higher Pod Desnity, Less Cost
- Disadvantaces of logical isolation: Requires more know-how, High Blast Radius, Who is cluster owner?

### Security Best Practices

![AppArmor](images/apparmor.png)

- Don't expose SSH to your nodes
- Use admission controller for container re gistry validation
- Use image scanning features
- Don't give root access to containers
- Use Linux Kernel features:

  - AppArmor

    _To limit the actions that containers can perform, you can use the AppArmor Linux kernel security module. AppArmor is available as part of the underlying AKS node OS, and is enabled by default._

  - Seccomp

    _While AppArmor works for any Linux application, seccomp (secure computing) works at the process level. Seccomp is also a Linux kernel security module, and is natively supported by the Docker runtime used by AKS nodes. With seccomp, the process calls that containers can perform are limited._

- Use Pod Level Security
  - use securityContext
- Always Pull Images (security patches)
- Use Pod Identity for accessing azure resources

### Resiliancy Best Practices

- Use Autoscaling
- AKS + ACI + VK for burst scenarios (`az aks install-connector`)
- Multi-Region clusters with Azure Traffic Managers
- Watch Logging and Monitoring

### References

https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/aks/operator-best-practices-cluster-security.md
