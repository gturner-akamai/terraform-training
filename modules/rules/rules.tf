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