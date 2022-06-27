To prepare the environment, ensure that these sets of pre-requisites are followed:
 1. Install ansible version up to 2.0 [a link](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
 2. Install vagrant tool [a link](https://www.vagrantup.com/docs/installation)
 3. vagrant up 

 The environment will be installing a kubernetes master with 2 nodes and jenkins master with jenkins slave.
As a prerequisistes, nesure that you are adding a jenkins slave by folloiwng the steps from this guide [a link](https://devopscube.com/setup-slaves-on-jenkins-2/)

# movie-recommender will be hosted in the jenkins slave
Here is the source code for the movie recommender tutorial.
# Run
To run the movie recommender, one must have Docker and Docker compose installed.
Then at a terminal inside the repo, one can run the docker compose with the following command:
Jenkinsfile will be installing the movie-recommnder application by using `docker-compose up`


# Build the pipeline

![pipeline](http://https://github.com/mklmfane/airbus-test/images/pipeline.png)