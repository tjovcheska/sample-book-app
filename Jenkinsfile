pipeline {
    agent any
    triggers {
        pollSCM('*/1 * * * *')
    }
    stages {
        stage('build-docker-image') {
            steps {
                build_docker_image()
            }
        }
        stage('deploy-dev') {
            steps {
                deploy("dev")
            }
        }
        stage('api-integration-tests-dev') {
            steps {
                run_api_tests("DEV")
            }
        }
        stage('deploy-stg') {
            steps {
                deploy("stg")
            }
        }
        stage('api-integration-tests-stg') {
            steps {
                run_api_tests("STG")
            }
        }
        stage('deploy-prd') {
            steps {
                deploy("prd")
            }
        }
        stage('api-integration-tests-prd') {
            steps {
                run_api_tests("PRD")
            }
        }
    }
}

def build_docker_image(){
    echo "Building docker image.."
    sh "docker build --no-cache -t teodorajovcheska7/sample-book-app ."

    echo "Runnning unit tests for node application in docker container.."
    sh "docker run --rm --entrypoint=npm teodorajovcheska7/sample-book-app run test"

    echo "Pushing docker image to docker registry.."
    sh "docker push teodorajovcheska7/sample-book-app"
}

def deploy(String environment){
    echo "Deployment triggered on ${environment} environment.."
    sh "docker-compose stop sample-book-app-${environment}"
    sh "docker-compose rm sample-book-app-${environment}"
    sh "docker-compose up -d sample-book-app-${environment}"
}

def run_api_tests(String environment){
    echo "API tests triggered on ${environment} environment.."
    sh "mkdir test-reports"
    sh "mkdir test-reports/${environment}"
    sh "mkdir ${environment}"
    sh "docker run -v ${PWD}/test-reports/dev:/api-test-automation/mochawesome-report/ --network=host --rm teodorajovcheska7/api-tests run BOOKS BOOKS_${environment}"
}