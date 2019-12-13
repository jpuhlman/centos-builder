FROM centos:7
RUN yum -y update
RUN yum install -y sudo vim rpm-build mock screen make git rpm python libstdc++.i686 lftp gcc gcc-g++
ENV RELEASE_DISTRO centos
ENV RELEASE_VERSION 7
COPY init.sh /
CMD  bash /init.sh
