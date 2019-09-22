# Configuration via Azure Key Vault

## Inspect the terraform template for the keyvault

Inspect the contents of the [keyvault.tf](../04-infrastructure-deployment/keyvault.tf) terraform template files

## Using Key Vault with credentials in a Kubernetes Secret

- Install the Key Vault FlexVolume

```bash
kubectl create -f https://raw.githubusercontent.com/Azure/kubernetes-keyvault-flexvol/master/deployment/kv-flexvol-installer.yaml
```
The command creates a [DaemonSet](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/), which ensures that all (or some) Nodes run a copy of a Pod.

- Create a secret containing the Service Principal Credentials to read from the Azure Key Vault

```bash
kubectl create secret generic kvcreds --from-literal clientid=$ARM_CLIENT_ID --from-literal clientsecret=$ARM_CLIENT_SECRET --type=azure/kv
```

- Create the pod with the FlexVolume referencing the Azure Key Vault

  - Edit the `nginx-flex-kv.yaml` file and replace values `"..."` with your environment's settings (you can get them by running `export` in your running container).
  - Optionally you could create a helm chart with `helm create nginx-flex-kv` and put the yaml file in the templates folder. The `"..."` parts can be replaced by setting the helm values.

```bash
kubectl create -f nginx-flex-kv.yaml
```

- Check out the flex volume contents

```bash
kubectl exec -it nginx-flex-kv cat /kvmnt/test-secret
```

## Using Key Vault with Pod Identity

- Inspect the contents of the [podidentity.tf](../04-infrastructure-deployment/podidentity.tf) template

- Run this command to create the aad-pod-identity deployment on an RBAC-enabled cluster:

```bash
kubectl apply -f https://raw.githubusercontent.com/Azure/aad-pod-identity/master/deploy/infra/deployment-rbac.yaml
```

- Get the `id` (azure resource id) and `clientId` of the identity created by terraform

```bash
az identity list -g aksws-weu-$ENVTAG-rg
```

- Replace the `<>` parts in the `aadpodidentity.yaml` file with the values of `id` and `clientId` gotten from the `az identity list` command and then apply identity and the binding

```bash
kubectl apply -f aadpodidentity.yaml
kubectl apply -f aadpodidentitybinding.yaml
```

- Create an example deployment with the `nginx-flex-kv-podidentity.yaml` (again replace the `"..."`s) and check out the pod and the `AzureAssignedIdentity` created based on the `AzureIdentityBinding` blueprint from the `aadpodidentitybinding.yaml`

```bash
kubectl apply -f nginx-flex-kv-podidentity.yaml

kubectl describe pod nginx-flex-kv-podid

kubectl get AzureAssignedIdentity
NAME                                         AGE
nginx-flex-kv-podid-default-aadpodidentity   20m
```

- Validate the pod can access the secret from Key Vault

```bash
kubectl exec -it nginx-flex-kv-podid cat /kvmnt/test-secret
secret-secret
```

## Using Azure Key Vault Certificates as environmental variables

See the [description](https://mrdevops.io/introducing-azure-key-vault-to-kubernetes-931f82364354) and their [github repo](https://github.com/SparebankenVest/azure-key-vault-to-kubernetes)

## Further reading

For more details [See also](https://github.com/Azure/kubernetes-keyvault-flexvol)