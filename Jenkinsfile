pipeline {

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    } 
    environment {
        GC_ACCESS_KEY_ID ="bec9621c-5bc7-400b-87a5-59c6e8bb2eac"
        GC_SECRET_ACCESS_KEY ="Dp8Q_DS0meoixjBob5doqo54vWaML0ZTL6yhl0wKSn4"
        GC_REGION= "ap-northeast-1"
    }
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/klinton330/CI-CD-Terraform.git'
            }
        }

        stage('Plan') {
            steps {
                bat 'terraform init'
                bat 'terraform plan -var-file=envs/dev/terraform.tfvars -out=tfplan'
                bat 'terraform show -no-color tfplan > tfplan.txt'
            }
        }

        stage('Approval') {
            when {
                not {
                    equals expected: true, actual: params.autoApprove
                }
            }

            steps {
                script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                }
            }
        }

        stage('Apply') {
            steps {
                bat 'terraform apply -var-file=envs/dev/terraform.tfvars --auto-approve'
            }
        }
stage('Destroy Approval') {
            when {
                not {
                    equals expected: true, actual: params.autoApprove
                }
            }

            steps {
                 input(message: 'Are you sure you want to destroy the environment?')
            }
        }

        stage('Destroy') {
            steps {
                bat 'terraform destroy -var-file=envs/dev/terraform.tfvars --auto-approve'
            }
        }
      }
    }

