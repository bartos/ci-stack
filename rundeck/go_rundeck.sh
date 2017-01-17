#!/bin/bash

#rundeckd="$JAVA_CMD $RDECK_JVM $RDECK_JVM_OPTS -cp $BOOTSTRAP_CP com.dtolabs.rundeck.RunServer $RDECK_BASE"

RDECK_INSTALL="${RDECK_INSTALL:-/var/lib/rundeck}"

RDECK_JVM=-Djava.security.auth.login.config=/etc/rundeck/jaas-loginmodule.conf \
         -Dloginmodule.name=RDpropertyfilelogin -Drdeck.config=/etc/rundeck \
         -Drundeck.server.configDir=/etc/rundeck -Dserver.datastore.path=/var/lib/rundeck/data/rundeck \
         -Drundeck.server.serverDir=/var/lib/rundeck -Drdeck.projects=/var/lib/rundeck/projects \
         -Drdeck.runlogs=/var/lib/rundeck/logs \
         -Drundeck.config.location=/etc/rundeck/rundeck-config.properties \
         -Djava.io.tmpdir=/tmp/rundeck \
         -Drundeck.server.workDir=/tmp/rundeck \
         -Dserver.http.port=4440 \
         -Xmx1024m -Xms256m \
         -XX:MaxPermSize=256m \
         -server

for jar in $(find $RDECK_INSTALL/bootstrap -name '*.jar') ; do
 =${BOOTSTRAP_CP:+$BOOTSTRAP_CP:}$jar
done

java $RDECK_JVM -cp $BOOTSTRAP_CP com.dtolabs.rundeck.RunServer /var/lib/rundeck


# RDECK_BASE
# /var/lib/rundeck