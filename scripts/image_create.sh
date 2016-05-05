#!/bin/bash

set -e
var=$1
CONTAINER_ID=$2

image=${var,,}
ctx logger info "Creating ${image}"
if [[ "$(docker images -q dtdwd/${image} 2> /dev/null)" = "" ]]; then
   sudo docker commit -m "new ${image} image" -a "rawa" ${CONTAINER_ID} dtdwd/${image}
fi
