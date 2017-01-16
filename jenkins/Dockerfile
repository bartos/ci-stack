FROM jenkins:2.32.1
USER root

#RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main">>/etc/apt/sources.list
RUN apt-get update && apt-get install -y sudo curl ansible git 
RUN rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

#docker
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz && tar --strip-components=1 -xvzf docker-latest.tgz -C /usr/bin

USER jenkins

COPY plugins.txt /var/jenins_home/plugins.txt
RUN /usr/local/bin/plugins.sh /var/jenins_home/plugins.txt
#RUN /usr/local/bin/install-plugins.sh /var/jenins_home/plugins.txt

COPY files/config/config.xml /usr/share/jenkins/ref/config.xml
COPY files/config/hudson.tasks.Maven.xml /usr/share/jenkins/ref/hudson.tasks.Maven.xml
COPY files/config/hudson.plugins.groovy.Groovy.xml /usr/share/jenkins/ref/hudson.plugins.groovy.Groovy.xml
COPY files/config/maven-global-settings-files.xml /usr/share/jenkins/ref/maven-global-settings-files.xml

# Jenkins Settings, i.e. Maven, Groovy, ...
COPY files/config/hudson.tasks.Maven.xml /usr/share/jenkins/ref/hudson.tasks.Maven.xml
COPY files/config/hudson.plugins.groovy.Groovy.xml /usr/share/jenkins/ref/hudson.plugins.groovy.Groovy.xml
COPY files/config/maven-global-settings-files.xml /usr/share/jenkins/ref/maven-global-settings-files.xml


# SSH Keys & Credentials
COPY files/config/credentials.xml /usr/share/jenkins/ref/credentials.xml
COPY files/config/ssh-keys/cd-demo /usr/share/jenkins/ref/.ssh/id_rsa
COPY files/config/ssh-keys/cd-demo.pub /usr/share/jenkins/ref/.ssh/id_rsa.pub

#https://github.com/jenkinsci/docker#preinstalling-plugins
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
#RUN echo 2.32.1 > /var/jenkins_home/jenkins.install.InstallUtil.lastExecVersion




