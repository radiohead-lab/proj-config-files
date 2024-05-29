FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y wget unzip openjdk-8-jre-headless gosu
COPY PharosControl-2.0.4-1.deb ./
RUN dpkg -i PharosControl-2.0.4-1.deb && \
    mkdir /var/lock/subsys

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

WORKDIR /opt/tplink/PharosControl

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/java", "-cp", "/opt/tplink/PharosControl/lib/*", "com.tplink.hipap.server.backend.PharosControlHeadless"]