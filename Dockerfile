# Download base image ubuntu 20.04
FROM ubuntu:22.04

# Update ubuntu and install dependencies
RUN export DEBIAN_FRONTEND=noninteractive && \
        apt update && \
        apt install -y -q --no-install-recommends\
        npm build-essential git curl ca-certificates apt-transport-https nano ruby-full libfontconfig1 zlib1g-dev python2 jekyll nano

# Install Node Version Manager plus Node
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/local/nvm
ENV NVM_DIR=/usr/local/nvm

ENV NODE_VERSION=v12.22.12

ADD https://raw.githubusercontent.com/creationix/nvm/master/install.sh /usr/local/etc/nvm/install.sh
RUN bash /usr/local/etc/nvm/install.sh && \
    bash -c ". $NVM_DIR/nvm.sh && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION && nvm use default"

ENV NVM_NODE_PATH ${NVM_DIR}/versions/node/${NODE_VERSION}
ENV NODE_PATH ${NVM_NODE_PATH}/lib/node_modules
ENV PATH      ${NVM_NODE_PATH}/bin:$PATH

WORKDIR /app

# Copy Source
COPY . .

# Install gulp
RUN npm install

RUN npm install -g gulp-cli gulp
RUN npm install gulp

EXPOSE 3000

ENTRYPOINT [ "bash", "./startupscript.sh" ]