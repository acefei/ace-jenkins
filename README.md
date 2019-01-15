# ace-jenkins
Docker orchestration for Ace Jenkins CI 


### Installation
[docker installation](https://github.com/acefei/ace-docker#installation)

### Usage
1. Start jenkins service alone.
```
$ adduser jenkins
$ su - jenkins
$ git clone https://github.com/acefei/ace-jenkins.git
$ cd ace-jenkins
$ docker-compose up -d jenkins 
```

2. Set your Jenkins Slave SSH key (public key of jenkins container).
```
$ docker exec -it jenkins ssh-keygen
$ echo JENKINS_SLAVE_SSH_PUBKEY=$(docker exec -it jenkins cat /var/jenkins_home/.ssh/id_rsa.pub) > .env
```

3. Getting all service start.
```
$ docker-compose down
$ docker-compose up -d
```

4. Check if it works or not.
```
$ docker exec -it jenkins ssh jenkins@acejenkins_worker_1
```

5. Access Jenkins at [http://localhost]()

#### Check logs
```
$ docker-compose logs master
$ docker-compose logs worker
```

#### Add more jenkins workder
```
$ docker-compose scale worker=4
```

#### Stop services and remove volumes
```
$ docker-compose down -v
```

#### Add a SSH Node on Jenkins UI
Access http://localhost/computer/ and **New Node** with below informations:
- **Remote root directory:** /home/jenkins
- **Labels:** linux
- **Launch method:** Launch agent agents via SSH
- **Host:** acejenkins_worker_1
- **Credentials:** jenkins(Jenkins Master SSH Key)
- **Host Key Verification Strategy:** Non verifying Verification Strategy
> NOTE:
1. The credential **Jenkins(Jenkins Master SSH Key)** was created automatically on jenkins initialization, refer to [add_ssh_keypair_into_credential.groovy](https://github.com/acefei/ace-docker-jenkins-master/blob/master/init_scripts/add_ssh_keypair_into_credential.groovy)
2. To be sure that **The JDK Version** meets [requirements](https://jenkins.io/doc/administration/requirements/java/) on the linux agent and you can find it on [https://jdk.java.net/8/]()

### That's all, Have a fun!

> NOTE:
Avoid using a bind mount from a folder on the host machine into /var/jenkins_home, as this might result in file permission issues (the user used inside the container might not have rights to the folder on the host machine). If you really need to bind mount jenkins_home, ensure that the directory on the host is accessible by the jenkins user inside the container (jenkins user - uid 1000) or use -u some_other_user parameter with docker run.
