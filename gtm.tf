# import 123test.akadns.net from the "Advanced Technical Training" account
resource "akamai_gtm_domain" "my-gtm-domain" {
  contract                = akamai_cp_code.my_cp_code.contract_id
  group                   = data.akamai_group.group_id.id
  name                    = "123test.akadns.net"
  type                    = "basic"
  email_notification_list = ["nbedare@akamai.com"]
  load_imbalance_percentage       = 10
  comment                 = "Last Updated By:nbedare"
}