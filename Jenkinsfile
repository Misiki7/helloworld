pipeline {
    agent any
    stages {
        stage('package') {
            agent {
                docker {
                            image 'harbor.dev.wh.digitalchina.com/library/maven:3-jdk-8-whca-repsitory'
                            //args '-v /root/.m2:/root/.m2  -v /data/maven/apache-maven-3.6.0/conf/settings.xml:/root/.m2/settings.xml --entrypoint='
                }
            }
            steps {

                script{
                    echo "WORKSPACE: ${env.WORKSPACE}"
                    echo "Branch: ${env.NODE_NAME}"
                    sh 'mvn clean install package -Dmaven.test.skip=true'
                }
            }
        }

     stage('build') {
                agent none
                steps {
                    script{
                        echo "WORKSPACE：${env.WORKSPACE}"
                        echo "Branch：${env.NODE_NAME}"
                        withCredentials([usernamePassword(credentialsId: 'harbor', passwordVariable: 'password', usernameVariable: 'username')]) {
                        sh 'docker login harbor.dev.wh.digitalchina.com -u ${username} -p ${password}'
                        }
                        sh '''
                           cd $WORKSPACE@2
                           docker build -t $IMAGE -f $WORKSPACE/Dockerfile .
                           docker push $IMAGE
                           '''
                    }
                }
            }
   }
}