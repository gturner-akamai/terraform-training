# Terraform Training Week 11 - Modules
## Exercise 1  
  * Added the *modules* dir to contain the EdgeWorker resource
  * Needed to add a provider file with just the Akamai provider version info (no auth)
  * Needed to strip the leading "grp_" from the group data source because the EdgeWorker resource only wanted the group number


## Exercise 2  
  * Created the *rules* dir in the modules and placed the data definition for the rules in *rules.tf*
  * Added three vars for the rules defintion to *variables.tf* in the module so they could be called form the root dir
    * ab_test
    * origin_a
    * origin_b
  * Updated *outputs.tf* in the module to send the json for the rules to root dir
  * Called the rules module from the *property.tf* instead of defining the data source there
  * Used the json output from the rules in the property definition

