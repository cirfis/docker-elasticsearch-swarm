FROM docker.elastic.co/elasticsearch/elasticsearch:7.12.1

USER root

RUN yum install -y bind-utils

# https://www.elastic.co/guide/en/elasticsearch/reference/current/setup-configuration-memory.html
RUN echo "elasticsearch - memlock unlimited" >> /etc/security/limits.conf

# configuring system settings
# https://www.elastic.co/guide/en/elasticsearch/reference/current/setting-system-settings.html#limits.conf
RUN ulimit -n 65536

COPY es-docker /usr/share/elasticsearch/bin/
USER elasticsearch
