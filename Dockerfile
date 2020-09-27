FROM romeoz/docker-apache-php:latest

COPY *.php /var/www/app

ARG ARG_APACHE_LISTEN_PORT=8001
ENV APACHE_LISTEN_PORT=${ARG_APACHE_LISTEN_PORT}
RUN sed -s -i -e "s/80/${APACHE_LISTEN_PORT}/" /etc/apache2/ports.conf /etc/apache2/sites-available/*.conf /etc/apache2/sites-enabled/*.conf
EXPOSE ${APACHE_LISTEN_PORT}
