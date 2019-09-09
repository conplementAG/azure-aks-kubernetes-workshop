git clone https://github.com/conplementAG/azure-kubernetes-workshop.git
cd azure-kubernetes-workshop
docker build . -t aksws
<configure config.env>
docker run -it --rm -v %cd%:/usr/src/app --env-file ./config.test.env aksws
az login
az account list -o table
az account set -s <subscription id>./ap
cd terraform
./init_terraform.sh
