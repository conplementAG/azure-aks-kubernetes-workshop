# Infrastructure Deployment

[_Back to agenda_](../README.md)

## Creating the infrastructure with Terraform

### 1. Prerequisites

- Follow the 02-getting-started section.

### 2. Initialize terraform with remote state handling

Navigate to the `azure-kubernetes-workshop/04-infrastructure-deployment` folder inside the main container and then initialize the terraform.

```bash
./init_terraform.sh
```

### 3. Apply the terraform template

```bash
./apply_terraform.sh
```

### 4. Cleanup / resource deletion

To remove everything Terraform provisioned, run:

```bash
./destroy_terraform.sh
```

#### References

[repository of Dennis Zielke](https://github.com/denniszielke/phoenix/blob/master/hints/terraform.md)
