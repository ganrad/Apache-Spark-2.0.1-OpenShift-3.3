# Run latest version of Apache Spark 2.0.1 in a RHEL7 container
FROM centos7:latest
MAINTAINER Ganesh R, gradhakr@nilanet.com

# Upgrade the system
RUN yum -y upgrade
RUN yum -y install wget tar gunzip

# Download OpenJDK 8
RUN yum -y install java-1.8.0-openjdk-devel

# Set the Java & Keycloak Home env variables
ENV JAVA_HOME /usr/lib/jvm/java-openjdk 
ENV SPARK_DIR /Spark

# Download Apache Spark 2.0.1 (approx. 179mb)
RUN wget --no-cookies --no-check-certificate "http://d3kbcqa49mib13.cloudfront.net/spark-2.0.1-bin-hadoop2.7.tgz" -O /tmp/spark.tgz

# Switch directory 
WORKDIR ${SPARK_DIR}

# Unzip the file into current working directory
RUN tar -xzf /tmp/spark.tgz

# Export java bin directory
RUN export PATH=${JAVA_HOME}/bin:${PATH}

# Expose Spark master on default port 7077 on the container
EXPOSE 7077

# Expose Spark master webui (MasterWebUI) port 8080 on the container
EXPOSE 8080

# Expose Spark REST Server (StandaloneRestServer) port 6066 on the container
EXPOSE 6066

# Change perms for keycloak directory
RUN chmod -R 777 ./spark-2.0.1-bin-hadoop2.7

# Start the Apache Spark master server.
CMD ["./sbin/start-master.sh"]
