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
                    mkdir ${HOME}/$USERNAME \
                    && groupadd -g $GROUP_ID $USERNAME\
                    && useradd -r -u $USER_ID -g $USERNAME -d ${HOME}/$USERNAME $USERNAME\
                    && chown $USERNAME:$USERNAME ${HOME}/$USERNAME\
                    && USER $USERNAME\
                    && WORKDIR ${HOME}/$USERNAME\
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
