variable "dashboard_parts" {
  description = "Array containing parts for the dashboard"
}

variable "dashboard_name" {
  description = "Name of the azure dashboard"
}

variable "resource_group_name" {
  description = "Resource group to create the dashboard in"
}

variable "location" {
  description = "The region to create the resource in"
}

variable "tags" {
  description = "Tags for the resource"
  type        = map(string)
  default = {
    project    = "placeholder"
    managed_by = "terraform"
  }
}