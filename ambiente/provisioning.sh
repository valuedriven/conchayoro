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
amazon-linux-extras enable nginx1
yum install nginx -y
chkconfig nginx on
service nginx start
service nginx status

#Install MySQL
#-------------------------
yum install https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm -y
amazon-linux-extras install epel -y
yum install mysql-community-server -y
chkconfig mysqld on
service mysqld start
service mysqld status

#Config DB
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
node -e "console.log('Running Node.js ' + process.version)"

#Instalar frontend
git clone https://github.com/valuedriven/conchayoro.git
cd conchayoro

npm --prefix backend install
nohup node src/server.js > /dev/null 2>&1 &

npm --prefix frontend install
npm --prefix frontend run build
cp -r frontend/dist/* /usr/share/nginx/html/
cp frontend/nginx/default.conf.template /etc/nginx/templates/default.conf.template
service nginx restart


