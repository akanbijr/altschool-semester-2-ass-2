{\rtf1\ansi\ansicpg1252\cocoartf2580
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #!/bin/bash\
\
# Update package lists\
sudo apt update\
\
# Install Apache\
sudo apt install apache2 -y\
\
# Install MySQL and set the root password\
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password your_mysql_root_password'\
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password your_mysql_root_password'\
sudo apt install mysql-server -y\
\
# Install PHP and related modules\
sudo apt install php libapache2-mod-php php-mysql -y\
\
# Enable Apache modules\
sudo a2enmod php7.4\
sudo systemctl restart apache2\
\
# Restart MySQL service\
sudo systemctl restart mysql\
\
# Output the MySQL root password (for educational purposes only)\
echo "MySQL root password: your_mysql_root_password"\
\
# Secure MySQL installation (optional)\
# sudo mysql_secure_installation\
}