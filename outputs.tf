output "my_property" {
  value = akamai_property.my_property
}

output "group_id" {
  value = data.akamai_group.group_id
}

output "my_security_configuration" {
    value = akamai_appsec_configuration.my_security_configuration
}