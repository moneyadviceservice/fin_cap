pipeline {
    agent { label "master" }
    environment {
        COMPOSE_PROJECT_NAME = "${env.JOB_NAME}"
        GITHUB_TOKEN = credentials('masbuild-github-token')
        DANGER_CHANGE_ID = "${env.CHANGE_ID}"
        DANGER_CHANGE_URL = "${env.CHANGE_URL}"
        DANGER_JENKINS_URL = "${env.JENKINS_URL}"
        DANGER_GIT_URL = "https://github.com/moneyadviceservice/fin_cap.git"
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
            sh "docker-compose -f docker-compose.yml run --rm rails ./script/test"
          }
        }
        stage('danger') {
          when { branch 'PR-*'}
          steps {
            echo 'Conditional step for PR'
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
