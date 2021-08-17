#! /bin/bash

set -e
set -x

SCRIPT_DIRECTORY=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source ${SCRIPT_DIRECTORY}/image.env

for CENOS_VERSION in "centos7.9.2009" "centos8.3.2011"
do
    for ARCH in "amd64" "arm64"
    do
        IMAGE=${IMAGE_REPOSITORY}:${IMAGE_TAG_PREFIX}-${CENOS_VERSION}-linux-${ARCH}
        docker buildx build --platform linux/${ARCH} --rm ${SCRIPT_DIRECTORY} \
            -f ${SCRIPT_DIRECTORY}/Dockerfile \
            -t ${IMAGE} \
            --build-arg CENOS_VERSION=${CENOS_VERSION} \
            $@
    done
done
