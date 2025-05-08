FROM centos:6

RUN yum install -y epel-release && \
    yum install -y stunnel openssl && \
    yum clean all

COPY stunnel.conf /etc/stunnel/stunnel.conf

CMD ["stunnel", "/etc/stunnel/stunnel.conf"]

