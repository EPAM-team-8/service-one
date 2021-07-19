pipeline {
    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    
    agent any
    tools {
        terraform 'Terraform-11'
    }

    stages {

        stage('Terraform Init') {
            steps {
                dir('terraform'){
                sh ('terraform init')
                }
            }
        }
        
        stage('Terraform Plan') {
            steps {
                dir('terraform'){
                sh ('terraform plan')
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform'){
                sh ('terraform apply -auto-approve')
                 }
        }
    }
}
}