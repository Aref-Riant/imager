# Imager is a tool to pull, save, tag, and push docker images

## on remote server:
add image names in imglist (one per line)
run save.sh

## scp images/ and imglist folder to internal server into imager/

## on Internal server:
set your docker registry that you want to push images into, in push.sh file as 'remote_repo' variable
example:
remote_repo="docker.internal.net:5093"

login into registry, on uncomment docker login file

run bash push.sh
