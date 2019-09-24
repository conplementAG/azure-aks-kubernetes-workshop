# Basic Concepts

[_Back to overview_](README.md)

## Operational best practices

- Isolation
  - Physical Isolation with multiple cluster instances
  - Logical Isolation with namespaces of teams and environments
    - Scheduling: Resource Quotas
    - Networking: Network Policies
    - Authentication and Authorization: RBAC
    - Container Level Isolation
    - Advantages: Higher Pod Desnity, Less Cost
    - Disadvantaces: Requires more know-how, High Blast Radius, Who is cluster owner?
    - Check for kube-advisor
    - Don't use default namespace for production
- Networking
  - Kubenet (basic) vs. CNI (Azure CNI) (advanced)
  - Public Serv
  - ice via
  - Internal Load Balancer
- Maintainace at least 3 month
  - Security patches applied
  - Kured => Reboot nodes
  - One version at a time
- Don't expose SSH
- Use admission controller for container re gistry validation
- Use image scanning features
- Don't give root access to containers
- Use Linux Kernel features:
  - AppArmor
  - Seccomp
- Use Pod Level Security
  - use securityContext
- Always Pull Images
- Use Pod Identity for accessing azure resources
- Use Autoscaling
- AKS + ACI + VK for burst scenarios (`az aks install-connector`)
- Multi-Region clusters with Azure Traffic Managers
- Watch Logging and Monitoring
