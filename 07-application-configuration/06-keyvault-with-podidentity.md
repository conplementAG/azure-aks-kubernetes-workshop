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

- Assign rights to the identity to read from the key vault

```bash
# set policy to access keys in your Key Vault
az keyvault set-policy -n aksws-weu-$ENVTAG-kv --key-permissions get --spn <YOUR AZURE USER IDENTITY CLIENT ID>
# set policy to access secrets in your Key Vault
az keyvault set-policy -n aksws-weu-$ENVTAG-kv --secret-permissions get --spn <YOUR AZURE USER IDENTITY CLIENT ID>
# set policy to access certs in your Key Vault
az keyvault set-policy -n aksws-weu-$ENVTAG-kv --certificate-permissions get --spn <YOUR AZURE USER IDENTITY CLIENT ID>
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

- Validate that the pod can access the secret from Key Vault

```bash
kubectl exec -it nginx-flex-kv-podid cat /kvmnt/test-secret
secret-secret
```