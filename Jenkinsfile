pipeline {
    agent any
    stages {
        stage('build-docker-image') {
            steps {
                scripts{
                    build_docker_image()
                }
            }
        }
        stage('unit-tests') {
            steps {
                scripts{
                    run_unit_tests()
                }
            }
        }
        stage('deploy-dev') {
            steps {
                scripts{
                    deploy("DEV")
                }
            }
        }
        stage('api-integration-tests-dev') {
            steps {
                scripts{
                    run_api_tests("DEV")
                }
            }
        }
        stage('deploy-stg') {
            steps {
                scripts{
                    deploy("STG")
                }
            }
        }
        stage('api-integration-tests-stg') {
            steps {
                scripts{
                    run_api_tests("STG")
                }
            }
        }
        stage('deploy-prd') {
            steps {
                scripts{
                    deploy("PRD")
                }
            }
        }
        stage('api-integration-tests-prd') {
            steps {
                scripts{
                    run_api_tests("PRD")
                }
            }
        }
    }
}

def build_docker_image(){
    echo "Building docker image.."
}

def run_unit_tests(){
    echo "Runnning unit tests for node application in docker container.."
}

def deploy(String environment){
    echo "Deployment triggered on ${environment} environment.."
}

def run_api_tests(String environment){
    echo "API tests triggered on ${environment} environment.."
}