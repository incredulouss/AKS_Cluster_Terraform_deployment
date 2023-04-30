subscription_id = "xxx.xxx.xxx.xxx"
client_id       = "xxx.xxx.xxx.xxx"
client_secret   = "xxx.xxx.xxx.xxx"
tenant_id       = "xxx.xxx.xxx.xxx"

devRGName       = "Rg_dev"
dev-aks-cluster = "aksdev"
acr-name        = "devreg"
//Agent Pool configuration 
agnet_pool_name = "agentpool_dev_westeurope"
pool_count      = 3
vm_size         = "Standard_A2m_v2"
os_sku          = "Ubuntu"
#vnet_subnet_id  = "xxxxxxxxxx"
type = "VirtualMachineScaleSets"
#availability_zones = ["1","2","3"]
max_pods        = 30
os_disk_size_gb = 30

Enviroenmnet_tag = "Dev"