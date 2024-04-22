#!/bin/bash

#Update your linux system
sudo apt update -y
echo "Done with update package"

#Install your apache webserver
sudo apt install apache2 -y
echo "Done with Apache Installation"

#Install PHP
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update -y

#Install php8.2
sudo apt install php8.2 -y

#Installing Dependencies that makes Laravel runs
sudo apt install php8.2-curl php8.2-dom php8.2-mbstring php8.2-xml php8.2-mysql zip unzip -y
echo "Done with installing PHP"

#Enable rewrite
sudo a2enmod rewrite -y

#Restart your apache server
sudo systemctl restart apache2

#Install composer for Laravel
cd /usr/bin
install composer globally -y
sudo curl -sS https://getcomposer.org/installer | sudo php -q
sudo mv composer.phar composer

#Clone the laravel app repo inside /var/www and get dependencies
cd /var/www/
sudo git clone https://github.com/laravel/laravel.git
sudo chown -R $USER:$USER /var/www/laravel

#Get dependencies
cd laravel/
install composer autoloader -y
composer install --optimize-autoloader --no-dev --no-interaction
composer update --no-interaction

#Copy the content of the default env file to .env 
sudo cp .env.example .env

#Set permissions
sudo chown -R www-data storage
sudo chown -R www-data bootstrap/cache

#Configure apache for laravel
cd
cd /etc/apache2/sites-available/
sudo touch app.conf

#Define the apache configuration content and Write to the apache configuration file
sudo echo '<VirtualHost *:80>
    ServerName  192.168.50.10
    DocumentRoot /var/www/laravel/public

    <Directory /var/www/laravel>
	AllowOverride All
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/laravel-error.log
    CustomLog ${APACHE_LOG_DIR}/laravel-access.log combined
</VirtualHost>' | sudo tee /etc/apache2/sites-available/app.conf

#Enable site and restart apache
sudo a2ensite app.conf
sudo a2dissite 000-default.conf
sudo systemctl restart apache2

#Install MySQL Database
cd
sudo apt install mysql-server -y
sudo apt install mysql-client -y
sudo systemctl start mysql

#Configuring MySQL
sudo mysql -uroot -e "CREATE DATABASE Ademide;"
sudo mysql -uroot -e "CREATE USER 'Neriah'@'localhost' IDENTIFIED BY 'Vagrant';"
sudo mysql -uroot -e "GRANT ALL PRIVILEGES ON Ademide.* TO 'Neriah'@'localhost';"
echo "MySQL configured"

#Uncomment the DB settings in the .env file
cd /var/www/laravel

sudo sed -i "23 s/^#//g" /var/www/laravel/.env
sudo sed -i "24 s/^#//g" /var/www/laravel/.env
sudo sed -i "25 s/^#//g" /var/www/laravel/.env
sudo sed -i "26 s/^#//g" /var/www/laravel/.env
sudo sed -i "27 s/^#//g" /var/www/laravel/.env
sudo sed -i '22 s/=sqlite/=mysql/' /var/www/laravel/.env
sudo sed -i '23 s/=127.0.0.1/=localhost/' /var/www/laravel/.env
sudo sed -i '24 s/=3306/=3306/' /var/www/laravel/.env
sudo sed -i '25 s/=laravel/=Ademide/' /var/www/laravel/.env
sudo sed -i '26 s/=root/=Neriah/' /var/www/laravel/.env
sudo sed -i '27 s/=/=Vagrant/' /var/www/laravel/.env

#Migrate database and restart Apache
sudo php artisan key:generate
sudo php artisan storage:link
sudo php artisan migrate
sudo php artisan db:seed
sudo systemctl restart apache2
