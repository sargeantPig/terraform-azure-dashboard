output "dashboard_tile" {
  description = "The Tile schema json"
  value = local.tile_properties
}

output "title" {
  value = var.title
}
