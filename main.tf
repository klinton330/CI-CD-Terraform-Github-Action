provider "genesyscloud" {
  oauthclient_id = var.oauthclient_id
  oauthclient_secret = var.oauthclient_secret
  aws_region = var.aws_region
}

terraform {
  required_providers {
    genesyscloud = {
      source = "MyPureCloud/genesyscloud"
      version = "1.49.1"
    }
  }
}
module "datatable"{
source=".//modules//datatable"
}

module "Queues"{
source=".//modules//Queues"
}
module "userprompt"{
source=".//modules//userprompt"

}

module "action"{
  source=".//modules//action"
  stage_intid=var.stage_intid
  prod_intid=var.prod_intid
  dr_intid=var.dr_intid

  stage_Authorization=var.stage_Authorization
  prod_Authorization=var.prod_Authorization
  dr_Authorization=var.dr_Authorization

  stage_D013_dataaction_URL=var.stage_D013_dataaction_URL
  prod_D013_dataaction_URL=var.prod_D013_dataaction_URL
  dr_D013_dataaction_URL=var.dr_D013_dataaction_URL
}

resource "genesyscloud_flow" "INBOUNDCALL_TestTerraform" {
  depends_on        = [module.datatable, module.Queues,module.userprompt,module.action]
  file_content_hash = "${filesha256(var.inboundcallflow_dir)}"
  filepath          = "${var.inboundcallflow_dir}"
}