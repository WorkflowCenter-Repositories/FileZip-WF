#!/bin/bash

set -e
image=$1
CONTAINER_ID=$2

 sudo docker commit -m "new ${image} image" -a "rawa" ${CONTAINER_ID} dtdwd/${image}
