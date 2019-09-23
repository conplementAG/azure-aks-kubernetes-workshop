# Infrastructure Deployment

[_Back to agenda_](../README.md)

## Creating the infrastructure with Terraform

### 1. Prerequisites

- use the main docker container of this repo
- use an env file including correct values e.g.: `ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, etc. see also [here](../README.md)
- create the service principals for [AD integration](https://docs.microsoft.com/en-us/azure/aks/azure-ad-integration)

### 2. Initialize terraform with remote state handling

Navigate to the `terraform` folder inside the container and then initialize the terraform.

```bash
./init_terraform.sh
```

### 3. Apply the terraform template

```bash
./apply_terraform.sh
```

### 4. Destroy the terraform state

```bash
./destroy_terraform.sh
```

#### References

[repository of Dennis Zielke](https://github.com/denniszielke/phoenix/blob/master/hints/terraform.md)
