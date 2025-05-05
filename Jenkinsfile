pipeline {
    agent any

    environment {
        ANYPOINT_USERNAME = credentials('AJMalak')
        ANYPOINT_PASSWORD = credentials('2011@MalakFirst')
        ANYPOINT_ENV      = 'dev'
        APP_NAME          = 'api-led-connectivity-project'
        REGION            = 'us-east-1'
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
                    anypoint-cli-v4 runtime-mgr cloudhub-application deploy ${APP_NAME} \
                    --username=${ANYPOINT_USERNAME} --password=${ANYPOINT_PASSWORD} \
                    --environment=${ANYPOINT_ENV} --region=${REGION} \
                    --workers 1 --workerType MICRO \
                    --runtimeVersion 4.4.0 \
                    --file target/${APP_NAME}-1.0.0.jar
                """
            }
        }
    }
}
