FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y nsis && \
    apt-get install -y wget && \
    apt-get install -y build-essential

# Java

RUN wget --no-cookies --header "Cookie: gpw_e24=xxx; oraclelicense=accept-securebackup-cookie;" "https://download.oracle.com/otn-pub/java/jdk/8u251-b08/3d5a2bb8f8d4428bbe94aed7ec7ae784/jdk-8u251-linux-x64.tar.gz"

RUN mkdir -p /usr/share/java
RUN tar -zxf jdk-8u251-linux-x64.tar.gz -C /usr/share/java --strip-components=1
RUN rm -f jdk-8u251-linux-x64.tar.gz
RUN update-alternatives --install /usr/bin/java java /usr/share/java/bin/java 100
ENV JAVA_HOME /usr/share/java

# Maven
ARG MAVEN_VERSION=3.6.3
ARG USER_HOME_DIR="/root"
ARG SHA=c35a1803a6e70a126e80b2b3ae33eed961f83ed74d18fcd16909b2d44d7dada3203f1ffe726c17ef8dcca2dcaa9fca676987befeadc9b9f759967a8cb77181c0
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

RUN apt-get update && \
    apt-get install -y \
      curl procps \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
  && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
  && echo "${SHA}  /tmp/apache-maven.tar.gz" | sha512sum -c - \
  && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
  && rm -f /tmp/apache-maven.tar.gz \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

# Launch4j

RUN wget "https://nchc.dl.sourceforge.net/project/launch4j/launch4j-3/3.12/launch4j-3.12-linux-x64.tgz"

RUN mkdir -p /usr/share/launch4j
RUN tar -zxf launch4j-3.12-linux-x64.tgz -C /usr/share/launch4j --strip-components=1
RUN rm -f launch4j-3.12-linux-x64.tgz
RUN chmod +x /usr/share/launch4j/launch4j/launch4j

ENV PATH $PATH:/usr/share/launch4j/launch4j