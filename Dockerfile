FROM alpine:3.3

MAINTAINER Chris Grgich-Tran <chris@grgichtran.com>

EXPOSE 3306
ENV TERM dumb
WORKDIR /app
VOLUME /app

RUN apk add --update bash mysql mysql-client && rm -f /var/cache/apk/*
COPY my.cnf /etc/mysql/my.cnf
COPY startup.sh /startup.sh
CMD ["/startup.sh"]
