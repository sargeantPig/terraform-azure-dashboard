output "dashboard" {
  description = "The constructed Dashboard Schema json"
  value = azurerm_portal_dashboard.dashboard.dashboard_properties
}