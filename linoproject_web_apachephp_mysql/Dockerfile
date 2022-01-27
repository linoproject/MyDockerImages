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

# RUN apt-get -yq install \
# 	vim 

#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

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

