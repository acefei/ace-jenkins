import jenkins.model.*
/*specify and set the number of executors of 
  your Jenkins master instance using a groovy 
  script, by default its set to 2 executors*/
Jenkins.instance.setNumExecutors(4)


