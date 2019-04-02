#!/bin/bash

echo "docker name:"
read docker_name
echo "docker ip:"
read docker_ip
echo "docker http port mapping:"
read docker_http_port
echo "docker https port mapping:"
read docker_https_port
echo "docker project folder:"
read docker_project_folder

echo "check your setting,If the information is correct, press yes to continue"
echo "================================"
echo ">> docker name:"$docker_name
echo ">> docker ip:"$docker_ip
echo ">> docker http port mapping:"$docker_http_port
echo ">> docker https port mapping:"$docker_https_port
echo ">> docker project folder:"$docker_project_folder
echo "================================"

read -p "(type [y/n] to continue...) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[yes]$ ]]
then
   docker run --name $docker_name --network phpteam --ip $docker_ip -d -p $docker_http_port:80 -p $docker_https_port:443 -v $docker_project_folder:/var/www/html  docker.reddoor.com.tw/phpteam/laravel56
   docker ps -a | grep $docker_name
fi
