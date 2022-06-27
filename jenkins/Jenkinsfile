node {
    checkout scm

    def customImage = docker.build("nginx:${env.BUILD_ID}")
}
