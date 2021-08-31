# docker-systemd

1. docker image: [dockerhub](https://hub.docker.com/r/wangz2019/docker-systemd)
2. source code: [github](https://github.com/ben-wangz/docker-systemd)
3. docs: [docker-systemd-docs](https://ben-wangz.github.io/docker-systemd/index.html)

## what's it

1. docker image of centos with systemd
2. bind with sshd
3. mainly used for testing environment construction

## limitations

1. only supporting amd64 and arm64
2. only supporting centos7 and centos8 as base image
3. "UseDNS no" written to /etc/ssh/sshd_config

## todo list

1. add test scripts for sshd

## usage

1. requirements
    * system os and arch
        + linux & amd64 (tested with centos 7)
        + linux & arm64 (not tested, but it will be okay)
        + mac & amd64 (not tested, but it will be okay)
        + mac & arm64 (tested with mac mini whose chip is apple m1)
        + windows & x86_64 (not tested, but it will be okay)
    * jdk 8 or higher to run gradle scripts
    * docker to build/run service
2. start service
    * build docker image
        + optional
        + ```shell
          ./gradlew :buildDockerImage
          ```
    * run docker container
        + ```shell
          ./gradlew :runDockerContainer
          ```
        + ssh service will be exposed with port 1022
3. test service
    * TODO
4. stop service
    * ```shell
      ./gradlew :stopDockerContainer
      ```
5. you can also jump into the container with ssh
    * ```shell
      ssh -o "UserKnownHostsFile /dev/null" -p 1022 root@localhost
      ```
6. build multi-platform images and push them to docker registry
    * ```shell
      ./gradlew :pushDockerImage
      ```
    * you need an environment to build multi-platform
      images: [develop with docker](https://blog.geekcity.tech/#/docs/develop.with.docker)
