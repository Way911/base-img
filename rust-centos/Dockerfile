FROM centos:7

ENV TZ=Asia/Shanghai
RUN yum update -y && yum groupinstall "Development Tools" -y && yum install gcc make openssl-devel -y
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone
RUN yum -y install kde-l10n-Chinese glibc-common
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
ENV LC_ALL zh_CN.utf8

RUN mkdir -p /usr/src/myapp
WORKDIR /usr/src/myapp

COPY rustup-init.sh /root/rustup-init.sh
RUN sh /root/rustup-init.sh -y --quiet && source /root/.cargo/env