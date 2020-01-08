FROM centos:8
RUN dnf -y update
RUN dnf -y groupinstall "Development Tools"
RUN dnf -y install epel-release
RUN dnf install -y sudo vim rpm-build mock screen make git rpm python2 python36 libstdc++.i686 lftp gcc glibc-langpack-en
RUN dnf --enablerepo=PowerTools install -y rpcgen
ENV RELEASE_DISTRO centos
ENV RELEASE_VERSION 8
COPY init.sh /
CMD  bash /init.sh
