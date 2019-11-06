FROM centos:7
RUN yum -y update
RUN yum install -y sudo vim rpm-build mock screen make git rpm python libstdc++.i686 lftp
COPY init.sh /
CMD  bash /init.sh
