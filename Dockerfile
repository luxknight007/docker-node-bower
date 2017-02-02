FROM luxknight007/centos:7

MAINTAINER Zoilo Dela Cruz <luxknight007@gmail.com>

ENV NODEJS node-v7.5.0-linux-x64.tar.xz

COPY $NODEJS /tmp

RUN groupadd --gid 1000 node \
 && useradd --uid 1000 --gid node --shell /bin/bash --create-home node

RUN tar -xJf /tmp/$NODEJS -C /usr/local --strip-components=1 \
  && rm /tmp/$NODEJS \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs

RUN npm install -g bower

# Required library for node and bower
RUN yum -y install git \
  bzip2 \
  gcc \
  ruby

# Install SASS
RUN gem install sass


# Create a user node for bower since bower does not required to be run in root or sudo
# RUN useradd -ms /bin/bash node

USER node
WORKDIR /home/node

CMD [ "node" ]