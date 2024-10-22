terraform {
  required_providers {
    genesyscloud = {
      source  = "registry.terraform.io/mypurecloud/genesyscloud"
      version = "1.49.1"
    }
  }
}
# Define variables for parameters to avoid hardcoding
variable "flowName" {}
variable "flowType" {}
variable "exportType" {
  default = "yaml"
}
variable "outputDir" {}
variable "exportFileName" {}
variable "location" {}
variable "ex_oauthclient_id" {}
variable "ex_oauthclient_secret" {}

resource "null_resource" "run_archy_export" {
  provisioner "local-exec" {
    command = join(" ", [
      "cd C:\\Users\\Klinton\\archy &&", 
      "archy export",
      "--flowName", var.flowName,
      "--flowType", var.flowType,
      "--exportType", var.exportType,
      "--outputDir", var.outputDir,
      "--exportFileName", var.exportFileName,
      "--location", var.location,
      "--clientId", var.ex_oauthclient_id,
      "--clientSecret", var.ex_oauthclient_secret,
      "--flowVersion latest",
      "--force"
    ])
  }
  triggers = {
    always_run = timestamp()
  }
}

