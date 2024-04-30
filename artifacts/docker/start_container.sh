IMG=pytorch/pytorch:1.12.1-cuda11.3-cudnn8-devel
REPO_NAME=gaussian_opacity_field
NAME=${USER}_${REPO_NAME}

docker run -it -d --name $NAME \
  --gpus all \
  --privileged \
  --hostname in_docker \
  --add-host in_docker:127.0.0.1 \
  --add-host $(hostname):127.0.0.1 \
  --shm-size 2G \
  -e DISPLAY \
  -p 50052:50051 \
  -p 6020:22 \
  -v /etc/localtime:/etc/localtime:ro \
  -v /media:/media \
  -v /mnt:/mnt \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ${PWD}:/${REPO_NAME} \
  -w /${REPO_NAME} \
  $IMG \
  /bin/bash


