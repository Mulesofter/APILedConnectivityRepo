pipeline {
    agent any

    environment {
        // These should be stored securely in Jenkins as credentials with ID: 'anypoint-credentials'
        ANYPOINT_CREDENTIALS = credentials('anypoint-credentials')
        ANYPOINT_ENV         = 'dev'
        APP_NAME             = 'api-led-connectivity-project'
        REGION               = 'us-east-1'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Mulesofter/APILedConnectivityRepo.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package -DmuleDeploy'
            }
        }

        stage('Deploy to CloudHub') {
            steps {
                sh """
                    anypoint-cli-v4 runtime-mgr cloudhub-application deploy ${APP_NAME} \\
                    --username=${ANYPOINT_CREDENTIALS_USR} \\
                    --password=${ANYPOINT_CREDENTIALS_PSW} \\
                    --environment=${ANYPOINT_ENV} \\
                    --region=${REGION} \\
                    --workers 1 --workerType MICRO \\
                    --runtimeVersion 4.4.0 \\
                    --file target/${APP_NAME}-1.0.0.jar
                """
            }
        }
    }
}
