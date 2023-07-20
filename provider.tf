
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.51.0"
    }
  }
  backend "azurerm" {
    //resource group of storage account in which we will store the state file
    resource_group_name  = ""

    //storage account name which will store the state file
    storage_account_name = ""
    container_name       = ""
    //key is the name of the state file, that will be created inside container
    key                  = "terraform_dev.tfstate"

    //Access_key is the primary key of the storage account, for best practise store access key in environment variable
    access_key           = ""
  }
}
