# tf-az-module-synapse-workspace
Terraform Module to create an Azure Synapse Analytics Workspace


# Azure Synapse Workspace Terraform Module

This Terraform module provisions an [Azure Synapse Analytics Workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_workspace) with full support for optional configurations like:

- Azure AD authentication
- GitHub or Azure DevOps repo integration
- Managed identities (SystemAssigned, UserAssigned)
- Customer-managed keys (CMK)
- Managed VNet, subnet, and compute isolation

---

## 🚀 Usage

```hcl
module "synapse_workspace" {
  source = "./modules/synapse_workspace"

  name                                 = var.name
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  storage_data_lake_gen2_filesystem_id = var.storage_data_lake_gen2_filesystem_id

  sql_administrator_login           = var.sql_administrator_login
  sql_administrator_login_password = var.sql_administrator_login_password

  azuread_authentication_only = var.azuread_authentication_only
  compute_subnet_id           = var.compute_subnet_id

  identity              = var.identity
  azure_devops_repo     = var.azure_devops_repo
  customer_managed_key  = var.customer_managed_key
  github_repo           = var.github_repo

  linking_allowed_for_aad_tenant_ids = var.linking_allowed_for_aad_tenant_ids
  managed_resource_group_name        = var.managed_resource_group_name
  managed_virtual_network_enabled    = var.managed_virtual_network_enabled
  public_network_access_enabled      = var.public_network_access_enabled
  purview_id                         = var.purview_id
  sql_identity_control_enabled       = var.sql_identity_control_enabled

  tags = var.tags
}
