variable "resource_id" {
  description = "Resource ID the metric is read from (e.g. a data collection rule, storage account, etc.)"
  type        = string
}

variable "metric_name" {
  description = "Name of the metric to chart (e.g. BytesReceived_Count)"
  type        = string
}

variable "metric_namespace" {
  description = "Metric namespace of the resource (e.g. microsoft.insights/datacollectionrules)"
  type        = string
}

variable "aggregation_type" {
  description = "Aggregation type for the metric (Azure Monitor AggregationType enum: 1=Average, 3=Min, 4=Max, 7=Total, 8=Count)"
  type        = number
  default     = 4
}

variable "chart_type" {
  description = "Chart visualization type (Azure Monitor ChartType enum: 2=Line, 3=Area, 4=Bar, 5=Scatter, 6=Grid)"
  type        = number
  default     = 2
}

variable "title" {
  description = "Title of the Tile"
  type = string
}

variable "display_name" {
  description = "Display name shown for the metric in the chart legend"
  type        = string
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
