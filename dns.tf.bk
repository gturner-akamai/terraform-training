resource "akamai_dns_record" "my_dns_hostnames" {
  count = length(local.app_hostnames)
 
  zone       = "gturner.test"
  recordtype = "A"
  ttl        = 60
  name       = local.app_hostnames[count.index]
  target     = ["192.168.30.1"]
}

resource "akamai_dns_record" "dns_foreach_records" {
  for_each = var.dns_records
 
  zone       = each.value.zone
  recordtype = each.value.recordType
  ttl        = each.value.ttl
  target     = [each.value.target]
  name       = each.value.name
}