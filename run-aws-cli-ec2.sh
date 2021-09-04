#!bin/sh

export PROJECT_NAME=conchayoro
export BACKEND_PROJECT=backend
export FRONTEND_PROJECT=frontend
export DATABASE_PROJECT=db
export AWS_ACCESS_KEY_ID=AKIAUCAQL4TJUBQUFXLG
export AWS_SECRET_ACCESS_KEY=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
export AWS_REGION=sa-east-1
export AVAILABILITY_ZONE=sa-east-1a
export ACCESS_KEY=conchayoro-key
export NODE_ENV=production
export INSTANCE_USER=ubuntu
export TAG=latest

sudo ssh-keygen -t rsa -N "" -f ~/.ssh/${ACCESS_KEY}
sudo chmod 400 ~/.ssh/${ACCESS_KEY}.pub

aws --debug ec2 run-instances --region ${AWS_REGION} --image-id ami-0c3c87b7d583d618f --instance-type t2.micro --key-name ${ACCESS_KEY}

aws ec2 describe-instances --region ${AWS_REGION}

