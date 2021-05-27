#!/bin/bash

export NODE_ENV=production
export HOST=localhost
export PORT=80
export BACKEND_HOST=$HOSTNAME
export BACKEND_PORT=3000

echo "Install git"
echo "-------------------------"
yum install git -y

echo "Install Nginx"
echo "-------------------------"
amazon-linux-extras enable nginx1
yum install nginx -y
chkconfig nginx on
service nginx start
service nginx status

echo "Install MySQL"
echo "-------------------------"
yum install https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm -y
amazon-linux-extras install epel -y
yum install mysql-community-server -y
chkconfig mysqld on
service mysqld start
service mysqld status

echo "Install Node.js"
echo "-------------------------"
yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_14.x | sudo -E bash -
yum install -y nodejs
node --version

echo "Clone APP"
echo "-------------------------"
git clone https://github.com/valuedriven/conchayoro.git
cd conchayoro

echo "Install backend"
echo "-------------------------"
cd backend
npm install
pm2-runtime ./process.yml
cd ..

echo "Install frontend"
echo "-------------------------"
npm --prefix frontend install
NODE_ENV=development npm --prefix frontend run build
cp -r frontend/dist/* /usr/share/nginx/html/
cp frontend/nginx/default.conf.template /etc/nginx/templates/
service nginx restart

echo "Config MySQL and config DB"
echo "-------------------------"
#grep 'temporary password' /var/log/mysqld.log
#2020-11-18T15:17:13.884662Z 6 [Note] [MY-010454] [Server] A temporary password is generated for root@localhost: ujtBqhNzE0>8
#mysql_secure_installation -p'ujtBqhNzE0>8'
#systemctl enable --now mysqld
#mysql -uroot -p
#mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY 'secretStr0ngPassw0rd!';