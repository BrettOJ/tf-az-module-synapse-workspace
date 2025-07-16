name                  = "synapse-ws-demo"
resource_group_name   = "rg-synapse-demo"
location              = "southeastasia"

storage_data_lake_gen2_filesystem_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-storage/providers/Microsoft.Storage/storageAccounts/synapsestorage/filesystems/synapsefs"

sql_administrator_login           = "synapseadmin"
sql_administrator_login_password = "StrongP@ssw0rd!"

azuread_authentication_only = false

compute_subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-network/providers/Microsoft.Network/virtualNetworks/vnet-demo/subnets/synapse-subnet"

identity = {
  type         = "SystemAssigned"
  identity_ids = null
}

azure_devops_repo = {
  account_name    = "devopsorg"
  branch_name     = "main"
  last_commit_id  = null
  project_name    = "synapse-project"
  repository_name = "synapse-repo"
  root_folder     = "/"
  tenant_id       = null
}

customer_managed_key = {
  key_versionless_id        = "https://kv-demo.vault.azure.net/keys/synapse-cmk"
  key_name                  = "synapse-cmk"
  user_assigned_identity_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-mi/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uami-synapse"
}

github_repo = {
  account_name    = "githubuser"
  branch_name     = "main"
  last_commit_id  = null
  repository_name = "synapse-github-repo"
  root_folder     = "/"
  git_url         = "https://github.com"
}

linking_allowed_for_aad_tenant_ids = [
  "00000000-0000-0000-0000-000000000000"
]

managed_resource_group_name     = "synapse-rg-managed"
managed_virtual_network_enabled = true
public_network_access_enabled   = false
purview_id                      = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-purview/providers/Microsoft.Purview/accounts/purview-demo"
sql_identity_control_enabled    = true

tags = {
  environment = "dev"
  project     = "synapse-demo"
}