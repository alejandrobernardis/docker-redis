# ==============================================================================
# Author: Alejandro M. BERNARDIS
# Email: alejandro.bernardis at gmail.com
# Created: 2019/11/11 10:49
# Description: Contenedor para Redis.
#
# Change History:
# ~~~~~~~~~~~~~~~
# 2019/11/11 (i0608156): Versión inicial.
#
# ==============================================================================

FROM redis/redis:5.0
LABEL maintainer "Alejandro M. BERNARDIS"

ENV REDIS_PASSWORD="R3D1xP4%%w0rd.17"

RUN mkdir -p /etc/redis
COPY conf/redis.conf.template /etc/redis/redis.conf

RUN rm -f /usr/local/bin/docker-entrypoint.sh
COPY conf/entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

RUN chown -R redis:redis /etc/redis/*

ENTRYPOINT ["docker-entrypoint.sh"]
