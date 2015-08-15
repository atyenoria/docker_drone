FROM quay.io/atyenoria/base

MAINTAINER atyenoria


#docker install
RUN curl -sSL https://get.docker.com/gpg | sudo apt-key add -
RUN curl -sSL https://get.docker.com/ | sh
RUN echo 'DOCKER_OPTS="-H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock"' >> /etc/default/docker


RUN wget http://downloads.drone.io/master/drone.deb
RUN dpkg -i drone.deb


EXPOSE 80
EXPOSE 2375

VOLUME /var/lib/drone
VOLUME /var/lib/docker



ENV DRONE_SERVER_PORT :80
ENV DRONE_DATABASE_DATASOURCE /var/lib/drone/drone.sqlite
ENV DRONE_GITHUB_CLIENT c4c5f26cb1820e0a850d
ENV DRONE_GITHUB_SECRET 027f22e14e011e383eab9c4e3717fd09bc5592cf


CMD service docker start && /usr/local/bin/droned
# ENTRYPOINT ["/usr/local/bin/droned"]






