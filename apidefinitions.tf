data "akamai_apidefinitions_api" "gturner_waaplab" {
  id         = akamai_apidefinitions_api.gturner_waaplab.id
  depends_on = [akamai_apidefinitions_api.gturner_waaplab]
}

data "akamai_apidefinitions_openapi" "gturner_waaplab_openapi" {
  #file_path = "${path.module}/api.yml"
  file_path = "api.yml"

}

resource "akamai_apidefinitions_api" "gturner_waaplab" {
  api         = data.akamai_apidefinitions_openapi.gturner_waaplab_openapi.api
  contract_id = "G-3AA39V0"
  group_id    = 170540
}

output "api_id" {
  value = akamai_apidefinitions_api.gturner_waaplab.id
}

output "api_latest_version" {
  value = data.akamai_apidefinitions_api.gturner_waaplab.latest_version
}

output "api_staging_version" {
  value = akamai_apidefinitions_api.gturner_waaplab.staging_version
}

output "api_production_version" {
  value = akamai_apidefinitions_api.gturner_waaplab.production_version
}