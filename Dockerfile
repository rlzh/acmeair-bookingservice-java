FROM websphere-liberty:microProfile1

COPY server.xml /config/server.xml

# Don't fail on rc 22 feature already installed
RUN installUtility install --acceptLicense defaultServer || if [ $? -ne 22 ]; then exit $?; fi

COPY jvm.options /config/jvm.options

COPY target/acmeair-bookingservice-java-2.0.0-SNAPSHOT.war /config/apps/

RUN server start && server stop

