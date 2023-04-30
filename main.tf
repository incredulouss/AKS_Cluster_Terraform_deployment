
provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id            = var.subscription_id
  client_id                  = var.client_id
  client_secret              = var.client_secret
  tenant_id                  = var.tenant_id
}

data "azurerm_resource_group" "dev_RG" {
  name = var.devRGName
}

resource "azurerm_kubernetes_cluster" "dev-aks-cluster" {
  name                = var.dev-aks-cluster
  location            = data.azurerm_resource_group.dev_RG.location
  resource_group_name = data.azurerm_resource_group.dev_RG.name
  dns_prefix          = var.dev-aks-cluster

  default_node_pool {
    name       = var.dev-aks-cluster
    node_count = var.pool_count
    vm_size    = var.vm_size
    os_sku     = var.os_sku
    #vnet_subnet_id = "${var.vnet_subnet_id}"
    type = var.type
    #availability_zones = ["1","2","3"]
    max_pods        = var.max_pods
    os_disk_size_gb = var.os_disk_size_gb
  }

  //Kubenet AKS Cluster
  network_profile {
    network_plugin = "kubenet"
    dns_service_ip = "10.2.2.254"
    service_cidr   = "10.2.2.0/24"
    pod_cidr       = "10.244.0.0/16"
  }

  //CNI AKS Cluster
  #   network_profile {
  #   network_plugin = "azure"
  #   service_cidr   = "10.0.0.0/16"
  #   dns_service_ip = "10.0.0.10"
  #   load_balancer_sku = "standard"
  # }

  depends_on = [
    data.azurerm_resource_group.dev_RG
  ]
  identity {
    type = "SystemAssigned"
  }
  tags = {
    Environment = "${var.Enviroenmnet_tag}"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.dev-aks-cluster.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.dev-aks-cluster.kube_config_raw

  sensitive = true
}
