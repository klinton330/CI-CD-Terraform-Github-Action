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

