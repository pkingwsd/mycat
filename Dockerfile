FROM ubuntu:18.04

ADD http://mirrors.linuxeye.com/jdk/jdk-8u172-linux-x64.tar.gz /usr/local/
ADD http://dl.mycat.io/1.6.6.1/Mycat-server-1.6.6.1-release-20181031195535-linux.tar.gz /usr/local
ADD http://mirror.bit.edu.cn/apache/zookeeper/zookeeper-3.4.13/zookeeper-3.4.13.tar.gz /usr/local
RUN cd /usr/local && tar -zxvf jdk-8u172-linux-x64.tar.gz && rm jdk-8u172-linux-x64.tar.gz&& ls -lna
RUN cd /usr/local && tar -zxvf Mycat-server-1.6.6.1-release-20181031195535-linux.tar.gz && rm Mycat-server-1.6.6.1-release-20181031195535-linux.tar.gz && ls -lna
RUN cd /usr/local && tar -zxvf zookeeper-3.4.13.tar.gz  && rm zookeeper-3.4.13.tar.gz && ls -lna && cp /usr/local/zookeeper-3.4.13/conf/zoo_sample.cfg /usr/local/zookeeper-3.4.13/conf/zoo.cfg

ENV JAVA_HOME /usr/local/jdk1.8.0_172
ENV CLASSPATH ${JAVA_HOME}/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH $PATH:${JAVA_HOME}/bin

RUN apt-get update && apt-get install -y \
  maven \
  git

VOLUME /usr/local/mycat/conf
VOLUME /usr/local/mycat/logs

EXPOSE 8066 9066

CMD  /usr/local/mycat/bin/mycat console
