# azdashboard

Keeping a dashboard version controlled is usually a lot of faff. This module allows dashboards to be managed without having to deal directly with .tftpl templates.

Builds an Azure Portal dashboard (`azurerm_portal_dashboard`) from a list of pre-rendered tiles.


## Usage

Each tile is built by calling a tile module under `modules/`, then the resulting `dashboard_tile`
outputs are collected into a list and passed to this module:

```hcl
module "full_logs" {
  source                       = "./modules/dashboard/modules/logs_tile"
  log_analytics_workspace_id   = azurerm_log_analytics_workspace.log_workspace.id
  log_analytics_workspace_name = azurerm_log_analytics_workspace.log_workspace.name
  kql_query                    = azurerm_log_analytics_query_pack_query.full_logs_query.body
  title                        = "Full logs"
  position                     = { x = 0, y = 0 }
  colspan                      = 8
  rowspan                      = 7
}

module "logs_ingestion_chart" {
  source           = "./modules/dashboard/modules/monitor_chart_tile"
  resource_id      = azurerm_monitor_data_collection_rule.bog_bot_dcr.id
  metric_name      = "BytesReceived_Count"
  metric_namespace = "microsoft.insights/datacollectionrules"
  display_name     = "Logs Ingestion Bytes per Min"
  title            = "Avg Logs Ingestion Bytes per Min"
  position         = { x = 0, y = 7 }
  colspan          = 9
  rowspan          = 3
}

module "notes" {
  source   = "./modules/dashboard/modules/markdown_tile"
  content  = "## example Monitor\nQueries refresh every few minutes."
  title    = "About this dashboard"
  position = { x = 9, y = 7 }
  colspan  = 6
  rowspan  = 3
}

module "example_dashboard" {
  source               = "./modules/dashboard"
  dashboard_name        = "example_dashboard"
  resource_group_name  = azurerm_resource_group.bog_bot.name
  location              = "uksouth"

  dashboard_parts = [
    module.full_logs.dashboard_tile,
    module.logs_ingestion_chart.dashboard_tile,
    module.notes.dashboard_tile,
  ]
}
```

## Tile modules

### `modules/logs_tile`

Renders a Log Analytics query as an `AnalyticsGrid` tile (`LogsDashboardPart`).

| Variable | Description |
|---|---|
| `log_analytics_workspace_id` | ID of the Log Analytics workspace the query runs against |
| `log_analytics_workspace_name` | Workspace name, shown as the tile subtitle |
| `kql_query` | The KQL query body |
| `title` | Tile title |
| `query_has_time_range` | Set `true` only if the query itself filters by `TimeGenerated`; otherwise leave `false` (default) so the portal doesn't warn that the query's time range may differ from the dashboard's |
| `position`, `colspan`, `rowspan` | Grid placement/size |

### `modules/monitor_chart_tile`

Renders an Azure Monitor platform metric as a chart (`MonitorChartPart`). Works against any
resource that emits platform metrics.

| Variable | Description |
|---|---|
| `resource_id` | ID of the resource the metric is read from |
| `metric_name` | Metric name (e.g. `BytesReceived_Count`) |
| `metric_namespace` | Metric namespace of the resource (e.g. `microsoft.insights/datacollectionrules`) |
| `aggregation_type` | Azure Monitor `AggregationType` enum: `1`=Average, `3`=Min, `4`=Max, `7`=Total, `8`=Count |
| `chart_type` | Azure Monitor `ChartType` enum: `2`=Line, `3`=Area, `4`=Bar, `5`=Scatter, `6`=Grid |
| `title` | Chart title |
| `display_name` | Legend label for the metric |
| `position`, `colspan`, `rowspan` | Grid placement/size |

### `modules/markdown_tile`

Renders static markdown (`MarkdownPart`).

| Variable | Description |
|---|---|
| `content` | Markdown content |
| `title` | Tile title |
| `position`, `colspan`, `rowspan` | Grid placement/size |

## `dashboard` module inputs/outputs

| Variable | Description |
|---|---|
| `dashboard_name` | Name of the dashboard resource |
| `resource_group_name` | Resource group to create it in |
| `location` | Azure region |
| `dashboard_parts` | List of `dashboard_tile` outputs from any of the tile modules above |
| `tags` | Tags for the resource |

| Output | Description |
|---|---|
| `dashboard` | The rendered `dashboard_properties` JSON |
