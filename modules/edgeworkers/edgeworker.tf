
#https://techdocs.akamai.com/terraform/docs/ew-rc-edgeworkers

resource "akamai_edgeworker" "my_edgeworker" {
  group_id         = var.group_id
  name             = var.ew_name
  resource_tier_id = var.resource_tier
  timeouts {
    default = "1h"
  }
}