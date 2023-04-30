AKS_Cluster_Terraform_deployment




Objective - Deploy Azure Kubernetes Cluster using terraform script





Deploying ask cluster from azure portal can take long time. To automate this process, I have written terraform script.





Steps to setup code in local computer


1.	Install terraform based on your OS.

You can follow below link

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli 


2.	Clone the repo

Git clone https://github.com/incredulouss/AKS_Cluster_Terraform_deployment.git


3.	Now run terraform init to setup everything

terraform init



Configure Environment tfvars file 


There is a file called env.tfvars , it will have all the environment variables. You can configure your AKS cluster based on these values.

For authentication to Azure I am using Service principle 


•	subscription_id = "xxx.xxx.xxx.xxx"

•	client_id       = "xxx.xxx.xxx.xxx"

•	client_secret   = "xxx.xxx.xxx.xxx"

•	tenant_id       = "xxx.xxx.xxx.xxx"

These values will authenticate to azure.

Note – Make sure the SP has required permission (Contributor Role) to make deployments in resource group

                                                                                                                                                                                          
                                                                                                                                                                                          
Terraform Commands to deploy script
•	terraform init 
•	terraform plan -var-file=”env.tfvars”
•	terrfarom apply -var-file=”env.tfvars”
