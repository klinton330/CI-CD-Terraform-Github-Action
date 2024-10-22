variable "oauthclient_id"{
   type= string 
    description= "Client ID"
}

variable "oauthclient_secret"{
   type= string 
    description= "Client Secret"
}
variable "aws_region"{
   type= string 
    description= "Region"
}

variable "inboundcallflow_dir"{
   type= string 
    description= "Name of the callflow"
    default=""
}

variable "stage_intid"{
   type= string 
    description= "Integration ID for webservices"
    default=""
}

variable "stage_Authorization"{
   type= string 
    description= "Authorization key "
    default=""
}

variable "prod_intid"{
   type= string 
    description= "Integration ID for webservices"
    default=""
}

variable "prod_Authorization"{
   type= string 
    description= "Authorization key "
    default=""
}
variable "dr_intid"{
   type= string 
    description= "Integration ID for webservices"
    default=""
}

variable "dr_Authorization"{
   type= string 
    description= "Authorization key "
    default=""
}

variable "stage_D013_dataaction_URL"{
   type= string 
    description= "Stage DA URL"
    default=""
}

variable "prod_D013_dataaction_URL"{
   type= string 
    description= "Prod DA URL "
    default=""
}
variable "dr_D013_dataaction_URL"{
   type= string 
    description= "DR DA URL"
    default=""
}

variable "flowName"{
   type= string 
   description= "Flow name to export"
   default="TestTerraform"
}
variable "flowType"{
   type= string 
   description= "Flow Type e.g Inbound, Inqueue "
   default="inboundcall"
}
variable "outputDir"{
   type= string 
   description= "Directory for Exported Flow"
   default="C:/Users/Klinton/Desktop/POJ&GIB/POC/Terraform/Testfiles/architect_flow/flow-6_ci_cd/callflow"
  
}

variable "exportFileName"{
    type= string 
    description= "Name for Exported File name"
    default="pointel"
}

variable "ex_oauthclient_id"{
   type= string 
    description= "Client ID"
    default="bec9621c-5bc7-400b-87a5-59c6e8bb2eac"
}

variable "ex_oauthclient_secret"{
   type= string 
    description= "Client Secret"
    default="yr3Q5b9Cmkd5qe_la2M87KsfDNgQlOjuYDNKoZvk8jk"
}
variable "location"{
   type= string 
    description= "Location"
    default="usw2.pure.cloud"
}
