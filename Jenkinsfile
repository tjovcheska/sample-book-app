pipeline {
    agent any
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
                run_api_tests("dev")
            }
        }
        stage('deploy-stg') {
            steps {
                deploy("stg")
            }
        }
        stage('api-integration-tests-stg') {
            steps {
                run_api_tests("stg")
            }
        }
        stage('deploy-prd') {
            steps {
                deploy("prd")
            }
        }
        stage('api-integration-tests-prd') {
            steps {
                run_api_tests("prd")
            }
        }
    }
}

def build_docker_image(){
    echo "Building docker image.."
    sh "docker build --no-cache -t teodorajovcheska7/sample-book-app ."
    
    echo "Runnning unit tests for node application in docker container.."
    sh "docker run --rm --entrypoint=npm teodorajovcheska7/sample-book-app run test"
    
    echo "Pushing docker image to docker registry..."
    sh "docker push teodorajovcheska7/sample-book-app"
}

def deploy(String environment){
    echo "Deployment triggered on ${environment} environment.."
    sh "docker-compose down"
    sh "docker-compose up sample-book-app-${enviornment}"
}

def run_api_tests(String environment){
    echo "API tests triggered on ${environment} environment.."
}