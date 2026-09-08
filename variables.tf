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

variable "default_time_range_hours" {
  description = "Default relative time range for the dashboard's time picker, in hours (e.g. 24 for \"Past 24 hours\")"
  type        = number
  default     = 24
}

variable "timezone" {
  description = "Timezone the dashboard's time range filter displays in: \"local\" (viewer's local timezone) or \"utc\""
  type        = string
  default     = "utc"

  validation {
    condition     = contains(["local", "utc"], var.timezone)
    error_message = "timezone must be either \"local\" or \"utc\"."
  }
}

variable "tags" {
  description = "Tags for the resource"
  type        = map(string)
  default = {
    project    = "placeholder"
    managed_by = "terraform"
  }
}