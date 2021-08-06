# docker-image-centos-systemd

## simple usage

```
cat $HOME/.ssh/id_rsa.pub > $(pwd)/authorized_keys
docker run --rm --privileged -p 1022:22 -v $(pwd)/authorized_keys:/root/.ssh/authorized_keys:ro -d wangz2019/centos-systemd:1.0.0-centos8.3.2011-linux-arm64
ssh -o "UserKnownHostsFile /dev/null" -p 1022 root@localhost
```
