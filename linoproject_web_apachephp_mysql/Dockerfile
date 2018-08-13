FROM ubuntu:latest
MAINTAINER Lino Telera Linoproject.net <linotelera@gmail.com>

# Install base packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive 
RUN apt-get -yq install \
        curl \
        apache2
 
RUN apt-get -yq install \
	php7.0 libapache2-mod-php7.0 php7.0-cli php7.0-common php7.0-mbstring php7.0-gd php7.0-intl php7.0-xml php7.0-mysql php7.0-mcrypt php7.0-zip

RUN apt-get -yq install \
	php7.0 sqlite

RUN apt-get -yq install \
	vim 

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN rm -rf /var/lib/apt/lists/*  


RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf #&& \
    #sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini

RUN sed -i -e 's/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf

RUN phpenmod mcrypt

# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

RUN usermod -u 33 www-data

EXPOSE 80
EXPOSE 443
EXPOSE 3306


WORKDIR /var/www/html

VOLUME ["/var/www/html", "/var/log/apache2", "/etc/apache2","/var/lib/mysql/"]
CMD ["/run.sh"]

