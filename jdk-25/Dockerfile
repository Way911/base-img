#base image
FROM centos:7

RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
RUN yum update -y
RUN yum -y install kde-l10n-Chinese glibc-common

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
ENV LC_ALL=zh_CN.utf8

RUN rpm --import https://yum.corretto.aws/corretto.key
RUN curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo
RUN yum install -y java-25-amazon-corretto-devel \
     && (find /usr/lib/jvm/java-25-amazon-corretto -name src.zip -delete || true)

ENV JAVA_HOME=/usr/lib/jvm/java-25-amazon-corretto
ENV PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:$JAVA_HOME/bin
