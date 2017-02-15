FROM cetres/centos-apache-php-oci:beta

MAINTAINER Gustavo Oliveira <cetres@gmail.com>

ENV APACHE_VERSION=2.4.6 \
    ORACLE_VERSION=11.2.0.4

LABEL io.k8s.description="Platform for building and running PHP with all needed drivers" \
      io.k8s.display-name="PHP Applications" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,apache,php,oci,sql" \
      io.openshift.s2i.scripts-url="image:///usr/local/s2i"

COPY ./s2i/bin/ /usr/local/s2i

RUN chown -R 1001:0 /var/log/httpd
RUN chown -R 1001:0 /var/www/html
RUN chown -R 1001:0 /run/httpd/
RUN chmod -R g+rwx /run/httpd

USER 1001

EXPOSE 8080

CMD ["usage"]
