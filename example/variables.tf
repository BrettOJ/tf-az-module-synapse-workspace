variable "name" {
  description = "Specifies the name which should be used for this Synapse Workspace."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group where the Synapse Workspace should exist."
  type        = string
}

variable "location" {
  description = "Azure Region where the Synapse Workspace should exist."
  type        = string
}

variable "identity" {
  description = "Managed Service Identity block for the Synapse Workspace."
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = null
}

variable "storage_data_lake_gen2_filesystem_id" {
  description = "ID of the storage data lake Gen2 filesystem resource."
  type        = string
}

variable "sql_administrator_login" {
  description = "Login name of the SQL administrator."
  type        = string
  default     = null
}

variable "sql_administrator_login_password" {
  description = "Password associated with the SQL administrator login."
  type        = string
  sensitive   = true
  default     = null
}

variable "azuread_authentication_only" {
  description = "Whether only Azure AD authentication is allowed."
  type        = bool
  default     = false
}

variable "compute_subnet_id" {
  description = "Subnet ID used for computes in the workspace."
  type        = string
  default     = null
}

variable "azure_devops_repo" {
  description = "Azure DevOps repo block."
  type = object({
    account_name    = string
    branch_name     = string
    last_commit_id  = optional(string)
    project_name    = string
    repository_name = string
    root_folder     = string
    tenant_id       = optional(string)
  })
  default = null
}

variable "data_exfiltration_protection_enabled" {
  description = "Whether data exfiltration protection is enabled."
  type        = bool
  default     = false
}

variable "customer_managed_key" {
  description = "Customer-managed key configuration."
  type = object({
    key_versionless_id       = string
    key_name                 = optional(string, "cmk")
    user_assigned_identity_id = optional(string)
  })
  default = null
}

variable "github_repo" {
  description = "GitHub repo configuration."
  type = object({
    account_name     = string
    branch_name      = string
    last_commit_id   = optional(string)
    repository_name  = string
    root_folder      = string
    git_url          = optional(string)
  })
  default = null
}

variable "linking_allowed_for_aad_tenant_ids" {
  description = "List of allowed AAD tenant IDs for linking."
  type        = list(string)
  default     = []
}

variable "managed_resource_group_name" {
  description = "Managed resource group name."
  type        = string
  default     = null
}

variable "managed_virtual_network_enabled" {
  description = "Enable virtual network for all computes in the workspace."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed."
  type        = bool
  default     = true
}

variable "purview_id" {
  description = "ID of the linked Purview account."
  type        = string
  default     = null
}

variable "sql_identity_control_enabled" {
  description = "Allow pipelines to access SQL pools using workspace identity."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to assign to the Synapse Workspace."
  type        = map(string)
  default     = {}
}
