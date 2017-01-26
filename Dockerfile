FROM luxknight007/centos:7

MAINTAINER Zoilo Dela Cruz <luxknight007@gmail.com>

ENV NODEJS node-v6.9.4-linux-x64.tar.xz

COPY $NODEJS /tmp

RUN groupadd --gid 1000 node \
  && useradd --uid 1000 --gid node --shell /bin/bash --create-home node

RUN tar -xJf /tmp/$NODEJS -C /usr/local --strip-components=1 \
  && rm /tmp/$NODEJS \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs

RUN npm install -g bower

#COMMANDS
# docker run -it --rm --name my-running-script -v "$PWD":/usr/src/app -w /usr/src/app luxknight007/node:latest bower init --allow-root

CMD [ "node" ]