FROM centos:7
RUN yum -y install java-1.8.0-openjdk unzip && yum clean all

EXPOSE 9000
# H2
EXPOSE 9092

ENV SONAR_VERSION=6.2
ENV SONAR_HOME=/opt/sonar
ADD https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-${SONAR_VERSION}.zip ${SONAR_HOME}/sonar.zip
#ADD sonarqube-${SONAR_VERSION}.zip ${SONAR_HOME}/sonar.zip
RUN unzip ${SONAR_HOME}/sonar.zip \
     && mv sonarqube-${SONAR_VERSION}/* ${SONAR_HOME} \
     && rm ${SONAR_HOME}/sonar.zip

#ADD run.sh $SONAR_HOME/bin
<<<<<<< HEAD
#ADD custom_logo.svg $SONAR_HOME/web/images/custom_logo.svg
=======
ADD custom_logo.svg $SONAR_HOME/web/images/custom_logo.svg
>>>>>>> 65844839ed5fa8aa96a670e42b630ecb2c7ef433
#plugins
#ADD http://central.maven.org/maven2/org/sonarsource/dotnet/sonar-csharp-plugin/5.6.0.586/sonar-csharp-plugin-5.6.0.586.jar $SONAR_HOME/extensions/plugins/sonar-csharp-plugin-5.6.0.586.jar
#ADD http://central.maven.org/maven2/org/sonarsource/java/sonar-java-plugin/4.4.0.8066/sonar-java-plugin-4.4.0.8066.jar $SONAR_HOME/extensions/plugins/sonar-java-plugin-4.4.0.8066.jar
#ADD http://central.maven.org/maven2/org/sonarsource/web/sonar-web-plugin/2.5.0.476/sonar-web-plugin-2.5.0.476.jar $SONAR_HOME/extensions/plugins/sonar-web-plugin-2.5.0.476.jar

WORKDIR ${SONAR_HOME}
VOLUME ["$SONAR_HOME/conf","$SONAR_HOME/data","$SONAR_HOME/logs"]

CMD java -jar lib/sonar-application-$SONAR_VERSION.jar \
    -Dsonar.log.console=true \
    -Dsonar.jdbc.username="$SONAR_JDBC_USERNAME" \
    -Dsonar.jdbc.password="$SONAR_JDBC_PASSWORD" \
    -Dsonar.jdbc.url="$SONAR_JDBC_URL" \
    -Dsonar.web.javaAdditionalOpts="-Djava.security.egd=file:/dev/./urandom" \
    -Dsonar.lf.logoUrl="/images/custom_logo.svg"
    

