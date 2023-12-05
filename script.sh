#! /bin/bash
# /var/lib/cloud/instances   ---userdata directory
#Install Apache:
sudo apt-get update

sudo apt-get update
sudo apt install -y apache2
sudo systemctl enable apache2
sudo service apache2 start
sudo apt install -y php7.4-fpm
sudo service apache2 restart

#Installing PHP 7.4

sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update
sudo apt-get install -y  php7.4
sudo apt install -y  php7.4-cli php7.4-common php7.4-imap php7.4-redis php7.4-snmp php7.4-xml php7.4-amqp php7.4-common php7.4-gd php7.4-ldap php7.4-odbc php7.4-readline php7.4-sqlite3 php7.4-xsl php7.4-yaml php7.4-zip php7.4-zmq php7.4-sybase php7.4-tidy php7.4-uuid php7.4-xdebug php7.4-xhprof php7.4-xml php7.4-redis php7.4-rrd php7.4-smbclient php7.4-snmp php7.4-soap php7.4-solr php7.4-opcache php7.4-pgsql php7.4-phpdbg php7.4-pspell php7.4-psr php7.4-raphf php7.4-curl php7.4-gmp php7.4-mailparse php7.4-ast php7.4-dba php7.4-igbinary php7.4-mbstring php7.4-bcmath php7.4-dev php7.4-imagick php7.4-memcached php7.4-bz2 php7.4-ds php7.4-imap php7.4-msgpack php7.4-cgi php7.4-enchant php7.4-interbase php7.4-mysql php7.4-cli php7.4-fpm php7.4-intl php7.4-oauth
#FOR php apache2/fpm in ubuntu 20.04


sudo a2enmod proxy_fcgi setenvif
sudo service apache2 restart
sudo a2enconf php7.4-fpm
sudo service apache2 restart

sudo a2enmod headers
sudo service apache2 restart
sudo a2enmod rewrite
sudo service apache2 restart

#Mysql client install

sudo apt-get install -y mysql-client

#sudo nano /etc/apache2/mods-enabled/dir.conf
#DirectoryIndex home.php index.html index.php
sudo sed -i -e '/DirectoryIndex/ s/ .*$/ home.php index.html index.php /' /etc/apache2/mods-enabled/dir.conf

#apach2 config

#sudo nano /etc/apache2/apache2.conf
#AllowOverride None > AllowOverride All
sudo sed -i -e '/AllowOverride/ s/ .*$/ All/' /etc/apache2/apache2.conf


#Install zip

sudo apt-get update
sudo apt-get install -y zip



#imprintnext installtion server requirement

sudo sed -i -e '/max_execution_time/ s/= .*$/= 500/' /etc/php/7.4/apache2/php.ini      #max_execution_time =500
sudo sed -i -e '/post_max_size/ s/= .*$/= 200M/' /etc/php/7.4/apache2/php.ini           #post_max_size = 200M 
sudo sed -i -e '/upload_max_filesize/ s/= .*$/= 180M/' /etc/php/7.4/apache2/php.ini      #upload_max_filesize = 180M
sudo sed -i -e '/max_file_uploads/ s/= .*$/= 180/' /etc/php/7.4/apache2/php.ini         #max_file_uploads = 180
sudo sed -i -e '/memory_limit/ s/= .*$/= 256M/' /etc/php/7.4/apache2/php.ini            #memory_limit = 256M
sudo sed -i -e '/max_input_time/ s/= .*$/= 600/' /etc/php/7.4/apache2/php.ini          #max_input_time = 600
sudo sed -i -e '/max_file_uploads/ s/= .*$/= 180/' /etc/php/7.4/apache2/php.ini        #max_file_uploads = 180


#install inkscape

sudo add-apt-repository ppa:inkscape.dev/stable -y
sudo apt update
sudo apt install -y inkscape



#install ghostscript

sudo apt-get update
sudo apt-get install -y ghostscript


#imagik

sudo apt-get install -y php7.4-imagick


