# Client Side Connectivity Testing

```bash
git clone https://github.com/conplementAG/azure-kubernetes-workshop.git
cd azure-kubernetes-workshop
git checkout -b origin/connectivity-test
docker build . -t aksws

# Create config.test.env from config.env template
# Configure azure settings in config.test.env

docker run -it --rm -v %cd%:/usr/src/app --env HTTP_PROXY=http://docker.for.win.localhost:3128 --env HTTPS_PROXY=http://docker.for.win.localhost:3128 --env-file ./config.test.env aksws

az login
az account list -o table
az account set -s <subscription id>./ap
cd terraform
./init_terraform.sh
./apply_terraform.sh

# Check in Azure Portal for new Resources

./destroy_terraform.sh

# Delete Azure resource-group in Azure Portal
```
