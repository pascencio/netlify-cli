FROM debian

ARG node_version=v10.24.1

RUN apt update -y && \
    apt install -y curl python2 build-essential && \
    adduser netlify --disabled-password --gecos ""

USER netlify

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash && \
    export NVM_DIR="$HOME/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    nvm install ${node_version}

USER root

RUN ln -s /home/netlify/.nvm/versions/node/${node_version}/bin/node /usr/local/bin/node && \
    ln -s /home/netlify/.nvm/versions/node/${node_version}/bin/npm /usr/local/bin/npm &&\
    ln -s /home/netlify/.nvm/versions/node/${node_version}/bin/netlify /usr/local/bin/netlify

USER netlify

RUN npm install -g netlify-cli