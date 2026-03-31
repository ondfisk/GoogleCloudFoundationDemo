variable "default_domain" {
  description = "The organization domain"
  type        = string
  default     = "ondfisk.dk"
}

variable "customer_id" {
  description = "The customer id for the associated resources"
  type        = string
  default     = "C01f7sfsg"
}

variable "billing_account" {
  description = "The ID of the billing account to associate projects with"
  type        = string
  default     = "01BBDA-F475E8-1DBC48"
}

variable "org_id" {
  description = "The organization id for the associated resources"
  type        = string
  default     = "280267019145"
}

variable "billing_project" {
  description = "The project id to use for billing"
  type        = string
  default     = "cs-host-da523270e8f545ca823a12"
}

variable "projects" {
  description = "The projects names and folders to create"
  type = list(object({
    name            = string
    folder          = string
    billing_account = optional(string)
    admin           = optional(string)
  }))
  default = []
}
