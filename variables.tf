variable "ab_test" {
  type        = string
  description = "test switch"
  default     = "A"

}

variable "apps" {
  type       = list
  default    = [ "www", "api", "blog", "shop", "cdn"]
}

variable "config_section" {
  type        = string
  description = "Section of the edgerc file to use"
  default     = "terraform"
}

variable "edgerc_path" {
  type        = string
  description = "Full path to edgerc file"
  default     = "~/.edgerc"
}
