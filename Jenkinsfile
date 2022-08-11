pipeline {
     environment {
            JENKINS_USER_NAME = "${sh(script:'id -un', returnStdout: true).trim()}"
            JENKINS_USER_ID = "${sh(script:'id -u', returnStdout: true).trim()}"
            JENKINS_GROUP_ID = "${sh(script:'id -g', returnStdout: true).trim()}"
    }
    agent {
        docker{
            image 'ubuntu:20.04'
            args '--privileged -v ${HOME}:${HOME}  -v jenkins_home:/var/jenkins_data -v /var/run/docker.sock:/var/run/docker.sock'
        }
     }

    stages {

        stage('prepare') {
            steps {
                sh '''
                    apt-get update && DEBIAN_FRONTEND="noninteractive" TZ="Europe/Berlin" apt-get install -y tzdata\
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
