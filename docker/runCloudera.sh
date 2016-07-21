#!/bin/sh
docker-machine start

echo "created docker images list:"
docker images
echo "created docker containers list:"
docker ps -a

eval "$(docker-machine env default)"

containerName="cloudera_quickstart_container"
docker stop $containerName
docker rm $containerName

# Build Cloudera image if it does not exists
cd_image="cloudera/quickstart/image"
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

docker run --privileged=true -ti -d -p 8888:8888 -p 80:80 -p 7180:7180 --name $containerName --hostname=quickstart.cloudera -v $(pwd)/mnt:/mnt $cd_image /usr/bin/docker-quickstart

#docker exec -ti -d $containerName /home/cloudera/cloudera-manager --express
#docker exec -ti $containerName /home/cloudera/kerberos

docker attach $containerName
