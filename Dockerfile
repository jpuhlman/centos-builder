FROM centos:8
RUN cd /etc/yum.repos.d/; \
    sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*; \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=https://vault.centos.org|g' /etc/yum.repos.d/CentOS-*; \
    sed -i 's|$releasever|8|' /etc/yum.repos.d/CentOS-*
RUN dnf -y update
RUN dnf --enablerepo=powertools install -y rpcgen lynx
RUN dnf -y groupinstall "Development Tools"
RUN dnf -y install epel-release
RUN dnf install -y lz4 sudo perl-open chrpath python3-langtable vim rpm-build mock screen make git rpm python2 python36 libstdc++.i686 lftp gcc glibc-langpack-en wget podman ncurses-compat-libs
RUN alternatives --set python /usr/bin/python2
ENV RELEASE_DISTRO centos
ENV RELEASE_VERSION 8
COPY init.sh /
CMD  bash /init.sh
