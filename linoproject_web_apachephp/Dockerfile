FROM ubuntu:focal


# Install base packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -yq install \
        curl \
        apache2
 
RUN apt-get -yq install \
	php libapache2-mod-php php-cli php-common php-mbstring \
    php-gd php-xml php-mysql php-zip

RUN apt-get -yq install \
	php sqlite


RUN rm -rf /var/lib/apt/lists/*  


RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

ADD 000-default.conf /etc/apache2/sites-available/000-default.conf

RUN phpenmod mcrypt
RUN a2enmod rewrite

# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

RUN usermod -u 33 www-data

EXPOSE 80
EXPOSE 443


WORKDIR /var/www/html

#RUN cd /var/lib && tar zcvf /root/mysql.tar.gz mysql # Old mysql restore method

VOLUME ["/var/www/html", "/var/log/apache2", "/etc/apache2"]
CMD ["/run.sh"]

