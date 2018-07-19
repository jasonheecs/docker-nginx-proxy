FROM jwilder/nginx-proxy:0.7.0

LABEL name="jasonheecs/nginx-proxy"
LABEL version="1.0.0"
LABEL maintainer="hello@jasonhee.com"

COPY conf /etc/nginx/conf.d

ENV DOCKER_HOST unix:///tmp/docker.sock

VOLUME ["/etc/nginx/certs", "/etc/nginx/dhparam"]

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["forego", "start", "-r"]