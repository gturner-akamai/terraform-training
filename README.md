# Terraform Training Week 9
Use AAP-ASM template from the [PS Terrafom Repo](https://git.source.akamai.com/projects/GSS-DEVOPS/repos/ps-terraform-templates/browse) to seed a new security config 


* Cloned the repo and updated the following:  
  * provider.tf
  * environments/qa/qa.tfvars

* Initiated the security config with:  
```pwsh deploy.ps1 aapasm -Env qa -Save -Notes "Session 9 - Terraform Template Testing```

* Experimented with updating differents parts of the security config by altering vars in the *qa.tfvars* 

