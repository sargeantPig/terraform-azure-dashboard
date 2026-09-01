variable "content" {
  description = "Markdown content to render in the tile"
  type        = string
}

variable "title" {
  description = "Title of the Tile"
  type = string
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
