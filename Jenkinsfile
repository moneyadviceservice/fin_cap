pipeline {
    agent { label "master" }
    environment {
        COMPOSE_PROJECT_NAME = "${env.JOB_NAME}"
        GITHUB_TOKEN = credentials('masbuild-github-token')
    }
    stages {
        stage('prepare') {
          steps {
            sh "docker-compose -f docker-compose.yml build --force-rm"
            sh "docker-compose -f docker-compose.yml up -d"
          }
        }
        stage('test') {
          steps {
            script {
              if (env.BRANCH_NAME == 'PR-*') {
                environment {
                  DANGER_CHANGE_ID = "${env.CHANGE_ID}"
                  DANGER_CHANGE_URL = "${env.CHANGE_URL}"
                  DANGER_JENKINS_URL = "${env.JENKINS_URL}"
                }
                echo 'Pull Request'
                sh "docker-compose -f docker-compose.yml run --rm rails './script/test danger'"
              } else {
                echo 'Not a Pull Request'
                sh "docker-compose -f docker-compose.yml run --rm rails ./script/test"
              }
            }
          }
        }
    }
    post {
        always {
            sh 'docker-compose -f docker-compose.yml down --remove-orphans'
            cleanWs()
        }
    }
}
