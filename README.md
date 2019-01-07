# ace-jenkins
Dockerizing Jenkins Setup


#### What will do on Jenkins initialization
- Jenkins plugin installation 
- Executing groovy scripts for tools installation or something.


#### Usage
1. If you have no docker-compose cmd, please add it first ([docker installation](https://github.com/acefei/ace-docker#installation)), then run the cmds as below:
```
adduser jenkins
su - jenkins
git clone https://github.com/acefei/ace-jenkins.git
cd ace-jenkins
docker-compose up
```

> NOTE:
Avoid using a bind mount from a folder on the host machine into /var/jenkins_home, as this might result in file permission issues (the user used inside the container might not have rights to the folder on the host machine). If you really need to bind mount jenkins_home, ensure that the directory on the host is accessible by the jenkins user inside the container (jenkins user - uid 1000) or use -u some_other_user parameter with docker run.
