pipeline {
    agent any
    environment {
        FIXINATOR_API_KEY     = credentials('FIXINATOR_API_KEY')
        CI = 1
    }
    stages {
        stage('Fixinator') {
            steps {
              curl -L -o /tmp/box.zip https://www.ortussolutions.com/parent/download/commandbox/type/bin
              unzip /tmp/box.zip -d /tmp/
              chmod a+x /tmp/box
              /tmp/box install fixinator'
              /tmp/box fixinator path=. confidence=high resultFormat=junit resultFile=./fixinator-report.xml
            }
        }
    }
    post {
        always {
            junit '**/fixinator-report.xml'
        }
    }
}
