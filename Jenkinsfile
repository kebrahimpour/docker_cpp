pipeline {
    agent {
        docker{
            image: 'ubuntu:20.04'
            args '-v ${HOME}:${HOME} -v /etc/localtime:/etc/localtime:ro -v $(pwd):/tz'
        }
     }

    stages {

        stage('prepare') {
            steps {
                sh '''
                    apt-get update && apt-get install -y apt-transport-https\
                    && apt-get install -y build-essential git wget cmake\
                    && cd ${HOME}      \
                    && wget --no-check-certificate --quiet \
                       https://boostorg.jfrog.io/artifactory/main/release/1.77.0/source/boost_1_77_0.tar.gz \
                    && tar xzf ./boost_1_77_0.tar.gz && \
                    && cd ./boost_1_77_0 \
                    && ./bootstrap.sh \
                    &&./b2 install \
                    && cd ..\
                    && rm -rf ./boost_1_77_0
                '''
            }
        }

        stage('Test') {
            steps {
                sh 'which g++'
            }
        }
    }
}
