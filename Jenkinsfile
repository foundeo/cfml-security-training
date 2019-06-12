pipeline {
    agent any
    environment {
        FIXINATOR_API_KEY     = credentials('FIXINATOR_API_KEY')
        CI = 1
    }
    stages {
        stage('Fixinator') {
            steps {
              sh 'curl -L -o /tmp/box.zip https://www.ortussolutions.com/parent/download/commandbox/type/bin'
              sh 'unzip /tmp/box.zip -d /tmp/'
              sh 'chmod a+x /tmp/box'
              sh '/tmp/box install fixinator'
              sh '/tmp/box fixinator path=. confidence=high resultFormat=junit resultFile=./fixinator-report.xml'
            }
        }
    }
    post {
        always {
            junit '**/fixinator-report.xml'
        }
    }
}
