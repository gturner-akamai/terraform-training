# CP Code
resource "akamai_cp_code" "my_cp_code" {
  name        = "gturner-terraform-lab"
  contract_id = "G-3AA39V0"
  group_id    = data.akamai_group.group_id.id
  product_id  = "prd_Site_Defender"
  timeouts {
    update = "1h"
  }
}

output "cp_code" {
    value = akamai_cp_code.my_cp_code
}


# Edge Hostname
resource "akamai_edge_hostname" "my_edge_hostname" {
  product_id    = akamai_cp_code.my_cp_code.product_id
  contract_id   = akamai_cp_code.my_cp_code.contract_id
  group_id      = data.akamai_group.group_id.id
  edge_hostname = "ksdlab-terraform.juiceshoponline.com.edgesuite.net"
  ip_behavior   = "IPV4"
}

output "edge_hostname" {
  value = akamai_edge_hostname.my_edge_hostname
}


# Property

/* Moving the rules into a module (modules/rules) per Exercise 2

## build the Rules
## https://techdocs.akamai.com/terraform/docs/pm-ds-rules-builder
data "akamai_property_rules_builder" "my_default_rule" {
  rules_v2024_10_21 {
    name = "default"
    is_secure = false
    behavior {
      origin {
        origin_type = "CUSTOMER"
        #hostname = "3b5ba496da1c.mylabserver.com"
        hostname = var.ab_test == "A" ? "origin-a.example.com" : "origin-b.example.com"
        forward_host_header = "REQUEST_HOST_HEADER"
        cache_key_hostname = "REQUEST_HOST_HEADER"
        compress = true
        enable_true_client_ip = false
        http_port = 80
      }
    }

  }
}
*/

module "default_rules" {
  source   = "./modules/rules"

  ab_test  = var.ab_test
  origin_a = "origin-a.example.com"
  origin_b = "origin-b.example.com"
}


resource "akamai_property" "my_property" {
  name          = "gturner-terraform"
  product_id    = akamai_cp_code.my_cp_code.product_id
  contract_id   = akamai_cp_code.my_cp_code.contract_id
  group_id      = data.akamai_group.group_id.id
  rule_format   = "v2024-10-21"
  version_notes = "GTurner - Script Club Terraform Q4 2025"
  # rules         = data.akamai_property_rules_builder.my_default_rule.json
  rules         = module.default_rules.rules_json
  #hostnames {
  #  cname_from             = "gturner-terraform.ksdlab.juiceshoponline.com"
  #  cname_to               = akamai_edge_hostname.my_edge_hostname.edge_hostname
  #  cert_provisioning_type = "DEFAULT"
  #}
  dynamic "hostnames" {
    for_each = local.app_hostnames
    content {
      cname_from             = hostnames.value 
      cname_to               = "${hostnames.value}.edgesuite.net" 
      cert_provisioning_type = "DEFAULT"
    }
  }
}

# Setup EW by calling the module
module "edgeworker" {
  source = "./modules/edgeworkers"

  #input vars
  # the Edgeworker resource wants only the group number
  group_id = trimprefix(data.akamai_group.group_id.id, "grp_")
  ew_name  = "gturner-tf-edgeworker"
  resource_tier = 100
  
}

/*
resource "akamai_property_activation" "staging_activation" {
     property_id                    = akamai_property.my_property.id
     network                        = "STAGING"
     contact                        = ["gturner@akamai.com"]
     note                           = local.notes
     version                        = akamai_property.my_property.latest_version
     #auto_acknowledge_rule_warnings = true

     lifecycle {
       ignore_changes = [ note ]
     }
}

resource "akamai_property_activation" "prod_activation" {
     property_id                    = akamai_property.my_property.id
     network                        = "PRODUCTION"
     contact                        = ["gturner@akamai.com"]
     note                           = local.notes
     version                        = akamai_property.my_property.latest_version
     #auto_acknowledge_rule_warnings = true

     lifecycle {
       ignore_changes = [ note ]
     }

     depends_on = [ akamai_property_activation.staging_activation ]
}
*/