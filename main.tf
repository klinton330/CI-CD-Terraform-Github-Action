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
  dev_stage_intid=var.dev_stage_intid
  dev_stage_Authorization=var.dev_stage_Authorization
  west_stage_Authorization=var.west_stage_Authorization
  west_stage_intid=var.west_stage_intid
  dev_prod_intid=var.dev_prod_intid
  dev_prod_Authorization=var.dev_prod_Authorization
  dev_dr_intid=var.dev_dr_intid
  dev_dr_Authorization=var.dev_dr_Authorization
}

resource "genesyscloud_flow" "INBOUNDCALL_TestTerraform" {
  depends_on        = [module.datatable, module.Queues,module.userprompt,module.action]
  file_content_hash = "${filesha256(var.inboundcallflow_dir)}"
  filepath          = "${var.inboundcallflow_dir}"
}