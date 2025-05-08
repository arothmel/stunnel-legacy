FROM debian:wheezy

# Disable expired mirror check + point to archive.debian.org
RUN sed -i 's|http://deb.debian.org|http://archive.debian.org|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org|http://archive.debian.org|g' /etc/apt/sources.list && \
    sed -i '/wheezy-updates/d' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/10no--check-valid && \
    apt-get update && \
    apt-get install --allow-unauthenticated -y stunnel4 openssl && \
    apt-get clean
# Add the --allow-unauthenticated (or older --force-yes) flag

# Copy default config into container
COPY stunnel.conf /etc/stunnel/stunnel.conf

# Ensure logs directory exists
# RUN mkdir -p /var/log/stunnel

# Default command to run stunnel
CMD ["stunnel", "/etc/stunnel/stunnel.conf"]

