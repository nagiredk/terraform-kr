variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "my-terraform-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "tags" {
  description = "Tags for the resource group"
  type        = map(string)
  default     = {
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
}
