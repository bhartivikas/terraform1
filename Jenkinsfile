pipeline {
    
    environment {
        AWS_ACCESS_KEY_ID      = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY  = credentials('AWS_SECRET_ACCESS_KEY')
    }
    agent any
    stages {
        stage('Terraform init') {
            steps {
                 bat 'terraform init'
                
            }
        }
        stage('Terraform apply') {
            steps {
                 bat 'terraform apply --auto-approve'
                
            }
        }
    }
}
