#! /bin/bash

sudo yum update -y

#install docker
sudo amazon-linux-extras install docker
sudo service docker start
sudo chkconfig docker on
sudo usermod -a -G docker ec2-user

#install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#install image
sudo docker pull mysql:5.6