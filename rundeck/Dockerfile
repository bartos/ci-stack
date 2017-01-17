FROM centos:7

EXPOSE 4440

RUN yum install java-1.8.0-openjdk -y
RUN rpm -Uvh http://repo.rundeck.org/latest.rpm 
RUN yum install rundeck -y && yum clean all
ADD go_rundeck.sh /go_rundeck.sh
RUN cp /etc/rundeck/profile /go_rundeck2.sh && echo "\`\$rundeckd\`">>/go_rundeck2.sh
RUN chmod +x /go_rundeck*.sh 

CMD /go_rundeck2.sh


