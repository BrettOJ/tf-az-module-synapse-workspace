resource "azurerm_synapse_workspace" "this" {
  name                                 = var.name
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  storage_data_lake_gen2_filesystem_id = var.storage_data_lake_gen2_filesystem_id

  sql_administrator_login           = var.sql_administrator_login
  sql_administrator_login_password = var.sql_administrator_login_password

  azuread_authentication_only         = var.azuread_authentication_only
  compute_subnet_id                   = var.compute_subnet_id
  data_exfiltration_protection_enabled = var.data_exfiltration_protection_enabled
  linking_allowed_for_aad_tenant_ids = var.linking_allowed_for_aad_tenant_ids
  managed_resource_group_name        = var.managed_resource_group_name
  managed_virtual_network_enabled    = var.managed_virtual_network_enabled
  public_network_access_enabled      = var.public_network_access_enabled
  purview_id                         = var.purview_id
  sql_identity_control_enabled       = var.sql_identity_control_enabled
  tags                                = var.tags

  dynamic "identity" {
    for_each = var.identity != null ? [var.identity] : []
    content {
      type         = identity.value.type
      identity_ids = lookup(identity.value, "identity_ids", null)
    }
  }

  dynamic "azure_devops_repo" {
    for_each = var.azure_devops_repo != null ? [var.azure_devops_repo] : []
    content {
      account_name    = azure_devops_repo.value.account_name
      branch_name     = azure_devops_repo.value.branch_name
      last_commit_id  = lookup(azure_devops_repo.value, "last_commit_id", null)
      project_name    = azure_devops_repo.value.project_name
      repository_name = azure_devops_repo.value.repository_name
      root_folder     = azure_devops_repo.value.root_folder
      tenant_id       = lookup(azure_devops_repo.value, "tenant_id", null)
    }
  }

  dynamic "customer_managed_key" {
    for_each = var.customer_managed_key != null ? [var.customer_managed_key] : []
    content {
      key_versionless_id        = customer_managed_key.value.key_versionless_id
      key_name                  = lookup(customer_managed_key.value, "key_name", "cmk")
      user_assigned_identity_id = lookup(customer_managed_key.value, "user_assigned_identity_id", null)
    }
  }

  dynamic "github_repo" {
    for_each = var.github_repo != null ? [var.github_repo] : []
    content {
      account_name    = github_repo.value.account_name
      branch_name     = github_repo.value.branch_name
      last_commit_id  = lookup(github_repo.value, "last_commit_id", null)
      repository_name = github_repo.value.repository_name
      root_folder     = github_repo.value.root_folder
      git_url         = lookup(github_repo.value, "git_url", null)
    }
  }
}