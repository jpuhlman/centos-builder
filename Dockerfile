FROM centos:7
RUN yum -y update
RUN yum install -y epel-release sudo vim rpm-build mock screen make git rpm python libstdc++.i686 lftp gcc gcc-c++ diffstat lynx wget perl-Data-Dumper; \
    yum install -y zstd lttng-ust openssl-libs krb5-libs zlib libicu python3
ENV RELEASE_DISTRO centos
ENV RELEASE_VERSION 7
COPY init.sh /
ENV LANG en_US.UTF-8
CMD  bash /init.sh
