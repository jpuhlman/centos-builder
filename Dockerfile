FROM jpuhlman/centos-base:5.11
RUN yum -y update
RUN yum install -y which curl sudo vim rpm-build mock screen make git rpm python libstdc++.i686 lftp gcc gcc-c++ wget vim-enhanced
ENV RELEASE_DISTRO centos
ENV RELEASE_VERSION 5
COPY init.sh /
CMD  bash /init.sh
