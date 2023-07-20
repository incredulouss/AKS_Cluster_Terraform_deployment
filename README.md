
# AKS_Cluster_Terraform_deployment

### Objective 
Deploy Azure Kubernetes Cluster using terraform script
Deploying ask cluster from azure portal can take long time. To automate this process, I have written terraform script.

You can setup terraform in your local computer and run this script to deploy ASK clusters.

The state file will be stored in ADLSv2 container, and not be saved locally. 




### Steps to setup code in local computer

Setup Terraform

    1. Install terraform based on your OS. 

```bash
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli 
```
    

    2. Clone the repo
```bash
Git clone https://github.com/incredulouss/AKS_Cluster_Terraform_deployment.git
```


    3. Now run terraform init to setup everything
```bash
terraform init
```
### Configure Environment tfvars file 

There is a file called env.tfvars , it will have all the environment variables. You can configure your AKS cluster based on these values.

For authentication to Azure I am using Service principle 

```bash
•	subscription_id = "xxx.xxx.xxx.xxx"
•	client_id       = "xxx.xxx.xxx.xxx"
•	client_secret   = "xxx.xxx.xxx.xxx"
•	tenant_id       = "xxx.xxx.xxx.xxx"
```

These values will authenticate to azure.

Note – Make sure the SP has required permission (Contributor Role) to make deployments in resource group

#### Extra Configuration Features 

You can do some changes in main.tf to have more configurations in AKS cluster

1. Setup K8S Networking - In the current main.tf, the networking is setup to Kubenet. You can change it to CNI by uncommenting the CNI snippet and commenting kubenet snippet
2. Autentication - Currently using managed idenetity, for more granular control you can use service principle
     

### Terraform Commands to deploy script

```bash
•	terraform init 
•	terraform plan -var-file=”env.tfvars”
•	terrfarom apply -var-file=”env.tfvars”
```




## Features

- Reuseable
- Easily configurabale
- Detailed

