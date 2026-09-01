variable "log_analytics_workspace_id" {
  description = "ID of the log_analytics workspace"
}

variable "log_analytics_workspace_name" {
  description = "Name of the log_analytics workspace"
}

variable "kql_query" {
  description = "A KQL query for this tile"
}

variable "position" {
  description = "Position of the tile"
  type        = map(number)
  default = {
    x = 0
    y = 0
  }

}

variable "colspan" {
  description = "Width of the tile by columns"
  type        = number
  default     = 5
}

variable "rowspan" {
  description = "Height of the tile by rows"
  type        = number
  default     = 5
}

variable "title" {
  description = "Title of the Tile"
  type = string
}

variable "query_has_time_range" {
  description = "Does the query have a tim range set?"
  type = bool
  default = false
}