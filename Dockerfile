FROM python:3.7
RUN mkdir /app
COPY . /app/
WORKDIR /app

RUN apt-get update && \
    apt-get install openjdk-11-jre-headless -y && \
    apt-get install tzdata && \
    echo 'Asia/Shanghai' > /etc/timezone
RUN pip install -Ir requirements.txt

EXPOSE 5000
