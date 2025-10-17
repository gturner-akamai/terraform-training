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


variable "dns_records" {
  default = {
    "origin1" = {
      zone       = "gturner.test"
      recordType = "A"
      ttl        = 60
      target     = "172.233.190.92"
      name       = "origin-www.example.com"
    },
    "origin2" = {
      zone       = "gturner.test"
      recordType = "A"
      ttl        = 100
      target     = "173.233.190.93"
      name       = "origin-api.example.com"
    },
    "origin3" = {
      zone       = "gturner.test"
      recordType = "A"
      ttl        = 600
      target     = "174.233.190.94"
      name       = "origin-blog.example.com"
    }
  }
}