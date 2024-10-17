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
      Authorization = "Basic '${var.dev_stage_Authorization}'"
    }
    request_template     = "$${input.rawRequest}"
    request_type         = "POST"
    request_url_template = "https://apicallinfra-stg.pgf-life.co.jp/pgf/v1/cc/d013"
  }
  
  integration_id  = var.dev_stage_intid
  
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
      Authorization = "Basic '${var.dev_prod_Authorization}'"
    }
    request_template     = "$${input.rawRequest}"
    request_type         = "POST"
    request_url_template = "https://apicallinfra-prd.pgf-life.co.jp/pgf/v1/cc/d013"
  }
  
  integration_id  = var.dev_prod_intid
  
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
      Authorization = "Basic '${var.dev_dr_Authorization}'"
    }
    request_template     = "$${input.rawRequest}"
    request_type         = "POST"
    request_url_template = "https://apicallinfra-dr.pgf-life.co.jp/pgf/v1/cc/d013"
  }
  
  integration_id  = var.dev_dr_intid
  
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