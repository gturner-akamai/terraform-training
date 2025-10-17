resource "akamai_dns_record" "my_dns_hostnames" {
  count = length(local.app_hostnames)
 
  zone       = "gturner.test"
  recordtype = "A"
  ttl        = 60
  name       = local.app_hostnames[count.index]
  target     = ["192.168.30.1"]
}