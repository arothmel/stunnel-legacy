FROM alpine:latest

# explicitly enable community repo (best for modern Alpine)

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk update && apk add --no-cache \
    bash \
    openssl \
    curl \
    coreutils \
    iproute2 \
    iputils \
    bind-tools \
    tcpdump \
    netcat-openbsd \
    stunnel

# Copy default config into container
COPY stunnel.conf /etc/stunnel/stunnel.conf

# Ensure logs directory exists
RUN mkdir -p /var/log/stunnel

# Default command to run stunnel
CMD ["stunnel", "/etc/stunnel/stunnel.conf"]
