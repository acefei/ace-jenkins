# ace-jenkins
Docker orchestration for Ace Jenkins CI 


#### Installation
[docker installation](https://github.com/acefei/ace-docker#installation)

#### Usage
##### Prerequisites

1. Start jenkins service alone.
```
$ adduser jenkins
$ su - jenkins
$ git clone https://github.com/acefei/ace-jenkins.git
$ cd ace-jenkins
$ docker-compose up -d jenkins 
```

2. Get your Jenkins Slave SSH key (public key of jenkins container).
```
$ docker exec -it jenkins ssh-keygen
$ docker exec -it jenkins cat /var/jenkins_home/.ssh/id_rsa.pub
```

3. Set JENKINS_SLAVE_SSH_PUBKEY in .env file with the same directory of docker-compose.yml 
```
$ cat .env
JENKINS_SLAVE_SSH_PUBKEY=<output of `docker exec -it jenkins cat /var/jenkins_home/.ssh/id_rsa.pub`> 
```

4. Now, get all service start.
```
$ docker-compose down jenkins 
$ docker-compose up -d
```

5. Check if it works or not.
```
$ docker exec -it jenkins ssh jenkins@worker
```

6. Access Jenkins at [http://localhost]()

##### Check logs
```
$ docker-compose logs master
$ docker-compose logs worker
```

##### Add more jenkins workder
```
$ docker-compose scale worker=4
```

##### Stop services and remove volumes
```
$ docker-compose down -v
```

#### That's all, Have a fun!

> NOTE:
Avoid using a bind mount from a folder on the host machine into /var/jenkins_home, as this might result in file permission issues (the user used inside the container might not have rights to the folder on the host machine). If you really need to bind mount jenkins_home, ensure that the directory on the host is accessible by the jenkins user inside the container (jenkins user - uid 1000) or use -u some_other_user parameter with docker run.
