#!/bin/bash

export NODE_ENV=production
export HOST=localhost
export PORT=80
export BACKEND_HOST=localhost
export BACKEND_PORT=3000

#Update packages
#-------------------------
yum update -y

#Install git
#-------------------------
yum install git -y

# Install Nginx
#-------------------------
#amazon-linux-extras enable nginx1
#yum install nginx -y
#chkconfig nginx on
#service nginx start
#service nginx status

#Install MySQL
#-------------------------
yum install https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm -y
amazon-linux-extras install epel -y
yum install mysql-community-server -y
chkconfig mysqld on
service mysqld start
service mysqld status

#Config MySQL and config DB
#grep 'temporary password' /var/log/mysqld.log
#2020-11-18T15:17:13.884662Z 6 [Note] [MY-010454] [Server] A temporary password is generated for root@localhost: ujtBqhNzE0>8
#mysql_secure_installation -p'ujtBqhNzE0>8'
#systemctl enable --now mysqld
#mysql -uroot -p
#mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY 'secretStr0ngPassw0rd!';

# Install Node.js
# --------------------------
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install node
node --version

#Obter App
git clone https://github.com/valuedriven/conchayoro.git
cd conchayoro

#Instalar backend
cd backend
npm install
nohup node src/server.js > /dev/null 2>&1 &

cd ..
#Instalar frontend
export NODE_ENV=development
npm --prefix frontend install
npm --prefix frontend run build
export NODE_ENV=production
cp -r frontend/dist/* /usr/share/nginx/html/
mkdir /etc/nginx/templates/
cp frontend/nginx/default.conf.template /etc/nginx/templates/
service nginx restart