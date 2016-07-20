#!/bin/sh

if [ $# == 0 ]; then
  echo "This script expect container name argument. Example: ./runCloudera.sh cdh"
  exit 100
fi

docker-machine start
docker stop $1;docker rm $1
# Build Cloudera image if it does not exists
#
cd_image="cloudera"
cd_df="Dockerfile"
if [ `docker images $cd_image | wc -l` -lt 2 ]; then
  echo "Docker Image $cd_image do not exist..."
  echo "Builing docker image $cd_image"
  if [ -f $cd_df ]; then
    docker build -t $cd_image -f $cd_df .
  else
    echo "Can't find Dockerfile $cd_df in the current location"
    exit 200
  fi
fi

currentDir=$(pwd)

#docker run --privileged=true -ti -d -p 8888:8888 -p 80:80 -p 7180:7180 --name $1 --hostname=quickstart.cloudera -v ./:/mnt/Users $cd_image /usr/bin/docker-quickstart
docker run --privileged=true -ti -d -p 8888:8888 -p 80:80 -p 7180:7180 --name $1 --hostname=quickstart.cloudera -v $(pwd)/mnt:/mnt $cd_image /bin/bash

#docker exec -ti -d $1 /home/cloudera/cloudera-manager --express
#docker exec -ti $1 /home/cloudera/kerberos

docker attach $1
