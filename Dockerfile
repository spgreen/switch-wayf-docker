FROM php:7.3-apache

ENV WAYF_FILE SWITCHwayf_2.0_r79d9aa30_20190307.zip

WORKDIR /opt/wayf
RUN apt-get update && apt-get install -y wget unzip && \
    wget https://forge.switch.ch/attachments/download/2181/${WAYF_FILE} && \
    unzip ${WAYF_FILE} && \
    rm ${WAYF_FILE} && \
    cp etc/config.dist.php etc/config.php && \
    cp etc/IDProvider.conf.dist.php etc/IDProvider.conf.php && \
    mv -v /opt/wayf/www/WAYF /opt/wayf/www/DS && \
    a2enmod headers

COPY config/apache_wayf.conf /etc/apache2/sites-enabled/wayf.conf
COPY config/apache_security.conf /etc/apache2/conf-available/security.conf
COPY scripts/update.sh /usr/local/bin/update.sh
COPY scripts/run.sh /usr/local/bin/run.sh

CMD ["run.sh"]
