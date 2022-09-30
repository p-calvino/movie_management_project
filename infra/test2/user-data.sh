#!/bin/bash
#INSTALL GIT
sudo yum install git -y
#INSTALL DOCKER
sudo amazon-linux-extras install docker
#START DOCKER SERVICE
sudo service docker start
sudo usermod -a -G docker ec2-user
#CLONE MY MOVIE MANAGEMENT PROJECT REPO
git clone --branch branchdemo gitaddress
#BUILD MY DOCKER IMAGE - DOCKER FILE
cd movie_management_app/app
sudo docker build -t movie-mgmt .
#RUN MYSQL CONTAINER
#DEPLOY OUR DATABASE INSIDE THE MYSQL CONTAINER
#RUN MY CONTAINER - FLASK APP RUNNING

