FROM ubuntu:trusty

MAINTAINER Zhirayr Kazarosyan

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-proxy && \
  apt-get clean && rm -rf /var/lib/apt/lists/

EXPOSE 3306

ENTRYPOINT [ "mysql-proxy", "--proxy-address=:3306" ]

CMD [ "--keepalive", "--proxy-backend-addresses=$backend_address"]

