#base image
FROM centos:7

ADD ./CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
RUN yum update -y
RUN yum -y install kde-l10n-Chinese glibc-common
RUN yum install -y epel-release

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


RUN mkdir /opt/software \
    && yum -y install vim net-tools telnet tree wget curl openssl11 openssl11-devel \
    && yum install zlib-devel bzip2 bzip2-devel openssl openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel  gcc make libffi-devel -y
ADD ./Python-3.11.14.tgz /opt/software
WORKDIR /opt/software/Python-3.11.14
RUN export CFLAGS=$(pkg-config --cflags openssl11) && export LDFLAGS=$(pkg-config --libs openssl11) \
    && ./configure --enable-optimizations --prefix=/usr/local/python3.11.14 --enable-shared CFLAGS=-fPIC \
    && make \
    && make install
RUN mv /usr/bin/python /usr/bin/python2 \
    && ln -s /usr/local/python3.11.14/bin/python3 /usr/bin/python \
    && ln -s /usr/local/python3.11.14/bin/pip3 /usr/bin/pip3 \
    && ln -s /usr/local/python3.11.14/bin/pip3 /usr/bin/pip \
    && sed -i '1s/python/python2.7/g' /usr/bin/yum \
    && sed -i '1s/python/python2.7/g' /usr/libexec/urlgrabber-ext-down \
    && touch /etc/ld.so.conf.d/python.conf \
    && echo '/usr/local/python3.11.14/lib' >> /etc/ld.so.conf.d/python.conf \
    && ldconfig