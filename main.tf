resource "azurerm_portal_dashboard" "dashboard" {
  name                = var.dashboard_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags

  dashboard_properties = templatefile("${path.module}/templates/dashboard.json.tftpl", {
    dashboard_parts = jsonencode({
      for idx, part in var.dashboard_parts : tostring(idx) => jsondecode(part)
    })
  })
}
