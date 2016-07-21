
pwd
docker run --privileged=true -ti -p 8888:8888 -p 80:80 -p 7180:7180 --hostname=quickstart.cloudera -v d:/dev/docker-vagrant-for-dev-env/docker:/mnt 4239cd2958c6 /usr/bin/docker-quickstart