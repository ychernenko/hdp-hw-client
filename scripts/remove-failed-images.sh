#!/usr/bin/env bash

NAME='<none>'
IMAGE_ID=`./get-image-id.sh ${NAME}`

[[ ! -z ${IMAGE_ID} ]] && docker rmi ${IMAGE_ID}