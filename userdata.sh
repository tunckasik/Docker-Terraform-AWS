#! /bin/bash

sudo yum update -y

#install docker
sudo amazon-linux-extras install docker
sudo service docker start
sudo chkconfig docker on #enable
sudo usermod -a -G docker ec2-user

#install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#install image
sudo docker pull alpine
sudo docker pull mysql:5.6
sudo docker pull kodekloud/simple-webapp-mysql

#Configure the network and deploy the webapp
# sudo docker network create wp-mysql-network -d="bridge" --subnet="182.18.0.1/24" --gateway="182.18.0.1"
# sudo docker run -d --name mysql-db -e MYSQL_ROOT_PASSWORD="db_pass123" --network wp-mysql-network mysql:5.6
# sudo docker run -d --name webapp -e DB_Host="mysql-db" -e DB_Password="db_pass123" --network wp-mysql-network -p 38080:8080 --link mysql-db:mysql-db kodekloud/simple-webapp-mysql
