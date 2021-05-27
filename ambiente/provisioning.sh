#!/bin/bash

export NODE_ENV=production
export HOST=$HOSTNAME
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
#service nginx start
#service nginx status

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
npx pm2 start src/server.js
cd ..

echo "Install frontend"
echo "-------------------------"
npm --prefix frontend install
NODE_ENV=development npm --prefix frontend run build
cp -r frontend/dist/* /usr/share/nginx/html/
mkdir /etc/nginx/templates/
cp frontend/nginx/default.conf.template /etc/nginx/templates/
service nginx start
service nginx status

