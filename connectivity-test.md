# Client Side Connectivity Testing

```bash
git clone https://github.com/conplementAG/azure-kubernetes-workshop.git
cd azure-kubernetes-workshop
git checkout origin/connectivity-test
docker build . -t aksws

# Configure config.test.env

docker run -it --rm -v %cd%:/usr/src/app --env-file ./config.test.env aksws
az login
az account list -o table
az account set -s <subscription id>./ap
cd terraform
./init_terraform.sh
./apply_terraform.sh

# Check in Azure Portal for new Resources

./destroy_terraform.sh
```
