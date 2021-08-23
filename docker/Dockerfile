ARG CENOS_VERSION=centos8.3.2011
FROM centos:${CENOS_VERSION}
RUN for i in $(ls /lib/systemd/system/sysinit.target.wants/); \
        do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; \
    done \
    && rm -f /lib/systemd/system/multi-user.target.wants/* \
    && rm -f /etc/systemd/system/*.wants/* \
    && rm -f /lib/systemd/system/local-fs.target.wants/* \
    && rm -f /lib/systemd/system/sockets.target.wants/*udev* \
    && rm -f /lib/systemd/system/sockets.target.wants/*initctl* \
    && rm -f /lib/systemd/system/basic.target.wants/* \
    && rm -f /lib/systemd/system/anaconda.target.wants/* \
    && $(if [ "8" == "$(rpm --eval '%{centos_ver}')" ]; then echo dnf; else echo yum; fi) install -y openssh-server openssh-clients \
    && systemctl enable sshd \
    && mkdir -p $HOME/.ssh \
    && chmod 600 $HOME/.ssh \
    && echo "PermitRootLogin prohibit-password" >> /etc/ssh/sshd_config \
    && echo "PasswordAuthentication no" >> /etc/ssh/sshd_config \
    && echo "UseDNS no" >> /etc/ssh/sshd_config \
    && sed -i -r 's/^(.*pam_nologin.so)/#\1/g' /etc/pam.d/sshd
ENV TZ=Asia/Shanghai
CMD ["/usr/sbin/init"]

HEALTHCHECK --interval=10s --timeout=3s CMD systemctl is-active sshd || exit 1
