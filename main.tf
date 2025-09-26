# https://techdocs.akamai.com/terraform/docs/common-identifiers

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

data "akamai_group" "group_id" {
    group_name   = "TechWriterTestGroup"
    contract_id  = data.akamai_contracts.my_contract.contracts[0].contract_id
}

output "group_id" {
  value = data.akamai_group.group_id
}
