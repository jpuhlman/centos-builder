FROM centos:6
RUN sed -i /etc/yum.repos.d/CentOS-Base.repo -e "s,mirrorlist=,#mirrorlist=," -e "s,#baseurl=,baseurl=," -e "s,mirror.centos.org,vault.centos.org,g"
RUN yum -y update
RUN yum install -y sudo vim wget rpm-build mock screen make git rpm python libstdc++.i686 lftp gcc gcc-g++
ENV RELEASE_DISTRO centos
ENV RELEASE_VERSION 6
COPY init.sh /
CMD  bash /init.sh
