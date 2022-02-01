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

RUN apt-get -yq install mysql-server \
    mysql-client

RUN rm -rf /var/lib/apt/lists/*  


RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN sed -i -e 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf

RUN phpenmod mcrypt

# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

RUN usermod -u 33 www-data

EXPOSE 80
EXPOSE 443
EXPOSE 3306


WORKDIR /var/www/html

#RUN cd /var/lib && tar zcvf /root/mysql.tar.gz mysql # Old mysql restore method

VOLUME ["/var/www/html", "/var/log/apache2", "/etc/apache2","/var/lib/mysql/"]
CMD ["/run.sh"]

