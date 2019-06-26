# Creating the infrastructure with Terraform

***This page was heavily inspired by the github [repository of Dennis Zielke](https://github.com/denniszielke/phoenix/blob/master/hints/terraform.md)***

## 0. Ensure environmental variables have correct values
You should be running the main docker container and use an env file including correct values.
For example for the `ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, and so on ... see also [here](../README.md)

## 1. Initialize terraform with remote state handling
Navigate to the `terraform` folder inside the container and then initialize the terraform.
```bash
./init_terraform.sh
```

## 2. Apply the terraform template
```bash
./apply_terraform.sh
```

## 3. Observe the files of the terraform folder