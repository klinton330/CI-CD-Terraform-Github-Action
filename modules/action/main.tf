terraform {
  required_providers {
    genesyscloud = {
      source  = "MyPureCloud/genesyscloud"
      version = "1.49.1"
    }
  }
}

resource "genesyscloud_integration_action" "TestTerraform-DA-Stage" {
  name   = "TestTerraform-DA-Stage"
  secure = false
  
  config_request {
    headers = {
      Authorization = "Basic '${var.stage_Authorization}'"
    }
    request_template     = "$${input.rawRequest}"
    request_type         = "POST"
    request_url_template = var.stage_D013_dataaction_URL
  }
  
  integration_id  = var.stage_intid
  
  contract_input  = jsonencode({
    "additionalProperties": true,
    "properties": {
      "CURRENCYFLAG": {
        "type": "string"
      },
      "DATEFLAG": {
        "type": "string"
      }
    },
    "title": "Request",
    "type": "object"
  })
  
  contract_output = jsonencode({
    "additionalProperties": true,
    "properties": {
      "RESULT": {
        "type": "string"
      },
      "TTSRATE1": {
        "type": "string"
      },
      "TTSRATE2": {
        "type": "string"
      }
    },
    "title": "Response",
    "type": "object"
  })
  
  category = "Web Services Data Actions Stage"
  
  config_response {
    success_template = "$${rawResult}"
  }
}

resource "genesyscloud_integration_action" "TestTerraform-DA-Prod" {
  name   = "TestTerraform-DA-Prod"
  secure = false
  
  config_request {
    headers = {
      Authorization = "Basic '${var.prod_Authorization}'"
    }
    request_template     = "$${input.rawRequest}"
    request_type         = "POST"
    request_url_template = var.prod_D013_dataaction_URL
  }
  
  integration_id  = var.prod_intid
  
  contract_input  = jsonencode({
    "additionalProperties": true,
    "properties": {
      "CURRENCYFLAG": {
        "type": "string"
      },
      "DATEFLAG": {
        "type": "string"
      }
    },
    "title": "Request",
    "type": "object"
  })
  
  contract_output = jsonencode({
    "additionalProperties": true,
    "properties": {
      "RESULT": {
        "type": "string"
      },
      "TTSRATE1": {
        "type": "string"
      },
      "TTSRATE2": {
        "type": "string"
      }
    },
    "title": "Response",
    "type": "object"
  })
  
  category = "Web Services Data Actions Prod"
  
  config_response {
    success_template = "$${rawResult}"
  }
}

resource "genesyscloud_integration_action" "TestTerraform-DA-DR" {
  name   = "TestTerraform-DA - DR"
  secure = false
  
  config_request {
    headers = {
      Authorization = "Basic '${var.dr_Authorization}'"
    }
    request_template     = "$${input.rawRequest}"
    request_type         = "POST"
    request_url_template = var.dr_D013_dataaction_URL
  }
  
  integration_id  = var.dr_intid
  
  contract_input  = jsonencode({
    "additionalProperties": true,
    "properties": {
      "CURRENCYFLAG": {
        "type": "string"
      },
      "DATEFLAG": {
        "type": "string"
      }
    },
    "title": "Request",
    "type": "object"
  })
  
  contract_output = jsonencode({
    "additionalProperties": true,
    "properties": {
      "RESULT": {
        "type": "string"
      },
      "TTSRATE1": {
        "type": "string"
      },
      "TTSRATE2": {
        "type": "string"
      }
    },
    "title": "Response",
    "type": "object"
  })
  
  category = "Web Services Data Actions DR"
  
  config_response {
    success_template = "$${rawResult}"
  }
}