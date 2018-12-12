FROM cetres/centos-apache-php:latest

LABEL maintainer="Gustavo Oliveira <cetres@gmail.com>"

ENV APACHE_VERSION=2.4.6 \
    ORACLE_VERSION=18.3.0.0

LABEL io.k8s.description="Platform for building and running PHP with all needed drivers" \
      io.k8s.display-name="PHP Applications" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,apache,php,oci,sql" \
      io.openshift.s2i.scripts-url="image:///usr/local/s2i"

COPY ./s2i/bin/ /usr/local/s2i

RUN chown -R 1001:0 /var/log/httpd && \
    chown -R 1001:0 /var/www/html && \
    chown -R 1001:0 /run/httpd/ && \
    chown -R 1001:0 /usr/share/php && \
    chown -R 1001:0 /var/lib/php && \
    chmod -R g+rwx /var/log/httpd && \
    chmod -R g+rwx /var/www/html && \
    chmod -R g+rwx /run/httpd && \
    chmod -R g+rwx /usr/share/php && \
    chmod -R g+rwx /var/lib/php

USER 1001

EXPOSE 8080

CMD ["usage"]
