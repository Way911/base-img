#base image
FROM centos:7

RUN yum update -y
RUN yum -y install kde-l10n-Chinese glibc-common

RUN rpm --import https://yum.corretto.aws/corretto.key
RUN curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo
RUN yum install -y java-17-amazon-corretto-devel \
     && (find /usr/lib/jvm/java-17-amazon-corretto -name src.zip -delete || true)

ENV JAVA_HOME /usr/lib/jvm/java-17-amazon-corretto
ENV PATH /usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:$JAVA_HOME/bin
