#!/bin/bash
sudo yum update -y
sudo yum install git -y

curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
sudo yum install -y nodejs

git clone https://github.com/1Mangesh1/chat-app.git
cd chat-app

npm install
npm run start