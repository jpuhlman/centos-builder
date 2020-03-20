FROM i386/centos:6
RUN mkdir -p tmpfiles
RUN curl http://vault.centos.org/6.9/os/i386/Packages/util-linux-ng-2.17.2-12.28.el6.i686.rpm > tmp.rpm
RUN cd tmpfiles; rpm2cpio /tmp.rpm | cpio -id
RUN cp tmpfiles/usr/bin/linux32 /usr/bin/
RUN linux32 yum -y update
RUN linux32 yum install -y sudo vim rpm-build mock screen make git rpm python libstdc++.i686 lftp gcc gcc-g++
ENV RELEASE_DISTRO centos
ENV RELEASE_VERSION "6 - i386"
COPY init.sh /
CMD  bash /init.sh
