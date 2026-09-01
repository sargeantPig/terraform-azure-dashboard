locals {
  dimensions = jsonencode({
    "x" : var.position.x,
    "y" : var.position.y,
    "colSpan" : var.colspan,
    "rowSpan" : var.rowspan
  })
  tile_properties = templatefile("${path.module}/templates/metric_chart_tile.json.tftpl", {
    resource_id      = var.resource_id
    metric_name      = var.metric_name
    metric_namespace = var.metric_namespace
    aggregation_type = var.aggregation_type
    chart_type       = var.chart_type
    title            = var.title
    display_name     = var.display_name
    dimensions       = local.dimensions
  })
}