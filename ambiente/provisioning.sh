#!/bin/bash

export NODE_ENV=production
export VUE_APP_HOST=localhost
export VUE_APP_PORT=80
export HOST=$VUE_APP_HOST
export PORT=$VUE_APP_PORT
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
service nginx start
chkconfig nginx on
service nginx status

#Install PostGreSQL
#-------------------------
amazon-linux-extras enable postgresql12
yum install postgresql postgresql-server -y
chkconfig postgresql on
postgresql-setup initdb
service postgresql start
service postgresql status

#Config DB
#su - postgres

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
NODE_ENV=production pm2 start backend/src/server.js

npm --prefix frontend install
npm --prefix frontend run build
cp -r frontend/dist/* /usr/share/nginx/html/
cp frontend/nginx/default.conf.template /etc/nginx/templates/default.conf.template
service nginx restart


