FROM centos:6
RUN yum -y update
RUN yum install -y sudo vim rpm-build mock screen make git rpm python libstdc++.i686 lftp gcc gcc-g++
ENV RELEASE_DISTRO centos
ENV RELEASE_VERSION 6
COPY init.sh /
CMD  bash /init.sh
