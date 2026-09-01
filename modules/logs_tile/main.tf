locals {
  dimensions = jsonencode({
    "x" : var.position.x,
    "y" : var.position.y,
    "colSpan" : var.colspan,
    "rowSpan" : var.rowspan
  })
  tile_properties = templatefile("${path.module}/templates/logs_tile.json.tftpl", {
    log_analytics_workspace_id   = var.log_analytics_workspace_id
    log_feed_query               = var.kql_query
    log_analytics_workspace_name = var.log_analytics_workspace_name
    title                        = var.title
    query_has_time_range         = var.query_has_time_range
    dimensions                   = local.dimensions
  })
}