#base image
FROM rockylinux:9

RUN yum update -y

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone
RUN dnf install -y glibc-locale-source glibc-langpack-zh
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
ENV LC_ALL=zh_CN.utf8

RUN rpm --import https://yum.corretto.aws/corretto.key
RUN curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo
RUN yum install -y java-25-amazon-corretto-devel \
     && (find /usr/lib/jvm/java-25-amazon-corretto -name src.zip -delete || true)

ENV JAVA_HOME=/usr/lib/jvm/java-25-amazon-corretto
ENV PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:$JAVA_HOME/bin


# Python
RUN mkdir -p /opt/software \
    && yum -y --allowerasing install vim net-tools telnet tree wget curl \
    && yum install --allowerasing lzma xz-devel zlib-devel bzip2 bzip2-devel openssl openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make libffi-devel -y
ADD ./Python-3.11.14.tgz /opt/software
WORKDIR /opt/software/Python-3.11.14
RUN ./configure --enable-optimization --prefix=/usr/local/python3.11 --enable-shared CFLAGS=-fPIC \
    && make \
    && make install
RUN ln -s /usr/local/python3.11/bin/python3 /usr/bin/python \
    && ln -s /usr/local/python3.11/bin/pip3 /usr/bin/pip3 \
    && ln -s /usr/local/python3.11/bin/pip3 /usr/bin/pip \
    && touch /etc/ld.so.conf.d/python.conf \
    && echo '/usr/local/python3.11/lib' >> /etc/ld.so.conf.d/python.conf \
    && ldconfig
# Python JEP
ADD ./jep /var/jep
WORKDIR /var/jep
RUN python -m virtualenv --python=python3.11 venv
RUN source venv/bin/activate && \
    pip install numpy pandas xgboost -i https://pypi.tuna.tsinghua.edu.cn/simple && \
    pip install .
ENV LD_LIBRARY_PATH=/var/jep/venv/lib/python3.11/site-packages/jep