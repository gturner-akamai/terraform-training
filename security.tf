# Establish the first security config
resource "akamai_appsec_configuration" "my_security_configuration" {
 name        = "gturner_ses02_sec_config01"
 description = "Session 2 Security Config 1"
 # when using below the contract id returns as ctr_G-3AA39V0
 # but, it seems this resource requires the "ctr_" to be stripped
 # contract_id = data.akamai_contracts.my_contract.contracts[0].contract_id
 contract_id = "G-3AA39V0"
 group_id    = data.akamai_group.group_id.id
 host_names  = ["gturner.ksdlab.juiceshoponline.com"]
}


resource "akamai_appsec_security_policy" "policy01" {
  config_id              = akamai_appsec_configuration.my_security_configuration.config_id
  security_policy_name   = "policy01"
  security_policy_prefix = "pol1"
}

resource "akamai_appsec_security_policy" "policy02" {
  config_id              = akamai_appsec_configuration.my_security_configuration.config_id
  security_policy_name   = "policy02"
  security_policy_prefix = "pol2"
}