locals {
  time_range_relative   = "${var.default_time_range_hours}h"
  time_range_display    = "Past ${var.default_time_range_hours} hour${var.default_time_range_hours == 1 ? "" : "s"}"
  timezone_display_name = var.timezone == "local" ? "Local Time" : "UTC Time"
}

resource "azurerm_portal_dashboard" "dashboard" {
  name                = var.dashboard_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags

  dashboard_properties = templatefile("${path.module}/templates/dashboard.json.tftpl", {
    dashboard_parts = jsonencode({
      for idx, part in var.dashboard_parts : tostring(idx) => jsondecode(part)
    })
    default_time_range_hours = var.default_time_range_hours
    time_range_relative      = local.time_range_relative
    time_range_display       = local.time_range_display
    timezone                 = var.timezone
    timezone_display_name    = local.timezone_display_name
  })
}
