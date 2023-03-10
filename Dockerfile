FROM centos:7
RUN yum -y update
RUN yum -y install https://packages.endpointdev.com/rhel/7/os/x86_64/endpoint-repo.x86_64.rpm
RUN yum install -y epel-release git sudo vim rpm-build mock screen make rpm python libstdc++.i686 lftp gcc gcc-c++ diffstat lynx wget perl-Data-Dumper; \
    yum install -y zstd lttng-ust openssl-libs krb5-libs zlib libicu python3 xlsclients
ENV RELEASE_DISTRO centos
ENV RELEASE_VERSION 7
COPY init.sh /
ENV LANG en_US.UTF-8
CMD  bash /init.sh
