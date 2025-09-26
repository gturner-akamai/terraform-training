## https://techdocs.akamai.com/terraform/docs/common-identifiers

# Get the Contract ID
data "akamai_contracts" "my_contract" {
}

output "my_contract" {
  value = data.akamai_contracts.my_contract.contracts[0].contract_id
}

/*
data "akamai_contract" "my_contract" {
     group_name = "WAAP Technical Mastery"
}

output "my_contract" {
    value = data.akamai_contract.my_contract
}
*/

/*
data "akamai_groups" "my_groups" {
}

output "my_groups" {
  value = data.akamai_groups.my_groups
}
*/

data "akamai_group" "group_id" {
    group_name   = "Advanced Technical Training-G-3AA39V0"
    contract_id  = data.akamai_contracts.my_contract.contracts[0].contract_id
}

output "group_id" {
  value = data.akamai_group.group_id
}


## https://techdocs.akamai.com/terraform/docs/as-ds-configuration
/* 
data "akamai_appsec_configuration" "my_configurations" {
}

output "configuration_list" {
  value = data.akamai_appsec_configuration.my_configurations
}
*/

data "akamai_appsec_configuration" "my_configuration" {
    name = "gturner-ksd"
}

output "my_appsec_config" {
  value = data.akamai_appsec_configuration.my_configuration
}


## https://techdocs.akamai.com/terraform/docs/pm-ds-property
data "akamai_property" "my_property" {
  name    = "gturner-ksdlab"
}

output "my_property" {
  value = data.akamai_property.my_property
}