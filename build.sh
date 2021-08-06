#! /bin/bash

set -e
set -x

SCRIPT_DIRECOTRY=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source ${SCRIPT_DIRECOTRY}/image.env

for ARCH in "amd64" "arm64"
do
    IMAGE=${IMAGE_REPOSITORY}:${IMAGE_TAG_PREFIX}-linux-${ARCH}
    docker buildx build --platform linux/${ARCH} --rm ${SCRIPT_DIRECOTRY} \
        -f ${SCRIPT_DIRECOTRY}/Dockerfile \
        -t ${IMAGE} \
        --build-arg DIND_VERSION=${DIND_VERSION} \
        --build-arg ALPINE_MIRROR=${ALPINE_MIRROR} \
        --build-arg DOCKER_BUILDX_VERSION=${DOCKER_BUILDX_VERSION} \
        $@
done
