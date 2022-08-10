pipeline {
     environment {
            JENKINS_USER_NAME = "${sh(script:'id -un', returnStdout: true).trim()}"
            JENKINS_USER_ID = "${sh(script:'id -u', returnStdout: true).trim()}"
            JENKINS_GROUP_ID = "${sh(script:'id -g', returnStdout: true).trim()}"
    }
    agent {
        docker{
            image 'ubuntu:20.04'
            args '-v ${HOME}:${HOME}  -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock'
        }
     }

    stages {

        stage('prepare') {
            steps {
                sh '''
                    mkdir -p ${JENKINS_HOME}/$JENKINS_USER_NAME \
                    && useradd -r -u $JENKINS_USER_ID -g $JENKINS_USER_NAME -d ${JENKINS_HOME}/$JENKINS_USER_NAME $JENKINS_USER_NAME\
                    && chown $JENKINS_USER_NAME:$JENKINS_USER_NAME ${JENKINS_HOME}/$JENKINS_USER_NAME\
                    && USER $USERNAME\
                    && WORKDIR ${JENKINS_HOME}/$USERNAME\
                    && apt-get update && DEBIAN_FRONTEND="noninteractive" TZ="Europe/Berlin" apt-get install -y tzdata\
                    && apt-get install -y apt-transport-https\
                    && apt-get install -y build-essential git wget cmake libboost-all-dev
                    // && cd ${HOME} \
                    // && wget --no-check-certificate --quiet \
                    //    https://boostorg.jfrog.io/artifactory/main/release/1.77.0/source/boost_1_77_0.tar.gz \
                    // && tar xzf ./boost_1_77_0.tar.gz  \
                    // && cd ./boost_1_77_0 \
                    // && ./bootstrap.sh \
                    // &&./b2 install \
                    // && cd ..\
                    // && rm -rf ./boost_1_77_0
                '''
            }
        }

        stage('Build') {
            steps {
                sh '''
                cd ${HOME}
                mkdir -p build
                cd build
                cmake ..
                '''
            }
        }
    }
}
