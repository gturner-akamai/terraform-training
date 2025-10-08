variable "edgerc_path" {
  type        = string
  description = "Full path to edgerc file"
  default     = "~/.edgerc"
}
variable "config_section" {
  type        = string
  description = "Section of the edgerc file to use"
  default     = "terraform"
}
