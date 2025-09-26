terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = "~> 9.0"
    }
  }
  required_version = ">= 1.13"
}
 
provider "akamai" {
  edgerc         = "~/.edgerc"
  config_section = "terraform"
}
