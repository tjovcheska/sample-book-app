pipeline {
    agent any
    stages {
        stage('build-docker-image') {
            steps {
                echo 'Building docker image..'
            }
        }
        stage('unit-tests') {
            steps {
                echo 'Runnning unit tests for node application in docker container..'
            }
        }
        stage('deploy-dev') {
            steps {
                echo 'Deployment triggered on DEV environment..'
            }
        }
        stage('api-integration-tests-dev') {
            steps {
                echo 'Deployment triggered on DEV environment..'
            }
        }
        stage('deploy-stg') {
            steps {
                echo 'Deployment triggered on STG environment..'
            }
        }
        stage('api-integration-tests-stg') {
            steps {
                echo 'Deployment triggered on STG environment..'
            }
        }
        stage('deploy-prd') {
            steps {
                echo 'Deployment triggered on PRD environment..'
            }
        }
        stage('api-integration-tests-prd') {
            steps {
                echo 'Deployment triggered on PRD environment..'
            }
        }
    }
}