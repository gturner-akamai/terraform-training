# Terraform Training Week 5
* Added a GTM definition to the state by defining the resource in gtm.tf and then running  
```terraform import akamai_gtm_domain.my-gtm-domain 123test.akadns.net```

```
terraform state list
data.akamai_appsec_configuration.my_configuration
data.akamai_contracts.my_contract
data.akamai_group.group_id
data.akamai_property.ksdlab_property
data.akamai_property_rules_builder.my_default_rule
akamai_appsec_configuration.my_security_configuration
akamai_appsec_security_policy.policy01
akamai_appsec_security_policy.policy02
akamai_cp_code.my_cp_code
akamai_edge_hostname.my_edge_hostname
akamai_gtm_domain.my-gtm-domain
akamai_property.my_property
```

* Noted that the state doesn't recognize the resource until after it's imported.  Otherwise, the plan shows that Terraform will attempt to create the resource

* To import using the CLI, alterations to the generated _tf_ files are needed
  * For example, first an individual API definition was exported in a separate dir   
```akamai terraform --edgerc ~/.edgerc --section terraform export-apidefinitions API_965683```
  * Since the export assumes it is setting up an independent environment (eg, providers, etc) the API resource definitions are combined into their own tf file (apidefinitions.tf).  
The yaml file that defines the schema is also extracted (api.yml).  
Once that is complete, the import command from _import.sh_ is altered to use the new resource definition instead of the module:  
```terraform import akamai_apidefinitions_api.gturner_waaplab 965683:1```
  * This successfully imports the API into the state  
```
terraform state list
data.akamai_apidefinitions_api.gturner_waaplab
data.akamai_apidefinitions_openapi.gturner_waaplab_openapi
data.akamai_appsec_configuration.my_configuration
data.akamai_contracts.my_contract
data.akamai_group.group_id
data.akamai_property.ksdlab_property
data.akamai_property_rules_builder.my_default_rule
akamai_apidefinitions_api.gturner_waaplab
akamai_appsec_configuration.my_security_configuration
akamai_appsec_security_policy.policy01
akamai_appsec_security_policy.policy02
akamai_cp_code.my_cp_code
akamai_edge_hostname.my_edge_hostname
akamai_gtm_domain.my-gtm-domain
akamai_property.my_property
```

