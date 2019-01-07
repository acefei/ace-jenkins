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
