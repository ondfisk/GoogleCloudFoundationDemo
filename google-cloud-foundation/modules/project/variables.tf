variable "name" {
  description = "The display name of the project"
  type        = string
}

variable "org_id" {
  description = "The organization ID"
  type        = string
}

variable "billing_account" {
  description = "The billing account ID to associate with the project"
  type        = string
}

variable "folder_id" {
  description = "The folder ID to place the project under (optional)"
  type        = string
  default     = null
}

variable "activate_apis" {
  description = "List of APIs to activate on the project"
  type        = list(string)
  default     = []
}

variable "depends_on_policies" {
  description = "List of org policy module outputs to depend on"
  type        = list(any)
  default     = []
}

variable "admin" {
  description = "The admin of the project (prefix with e.g. user: or group:)"
  type        = string
  default     = null
}

variable "deletion_policy" {
  description = "The deletion policy for the project"
  type        = string
  default     = "DELETE"
}
