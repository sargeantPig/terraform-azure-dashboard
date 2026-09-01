locals {
  dimensions = jsonencode({
    "x" : var.position.x,
    "y" : var.position.y,
    "colSpan" : var.colspan,
    "rowSpan" : var.rowspan
  })
  tile_properties = templatefile("${path.module}/templates/markdown_tile.tftpl", {
    content    = var.content
    title      = var.title
    dimensions = local.dimensions
  })
}
