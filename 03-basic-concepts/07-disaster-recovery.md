# Basic Concepts

[_Back to overview_](README.md)

## Disaster Recovery

In a complex environment we have to expect failures and errors. Therefore we need a plan what to do when a disaster occurrs, so that the disaster does not actually happen.

### Multi-Regional Cluster

Follows to apporach: _Optimize for mean-time between failures_

- Plan for AKS clusters in multiple regions.
- Route traffic across multiple clusters by using Azure Traffic Manager.
- Use geo-replication for your container image registries.
- Plan for application state across multiple clusters.
- Replicate storage across multiple regions.

see: https://docs.microsoft.com/en-us/azure/aks/operator-best-practices-multi-region

### Destroy & Recreate

Follows to apporach: _Optimize for mean-time to repair/recover_

- Automate everything
- Execute regularly (for example in CI/CD)
- Implement idempotent
- backup data
