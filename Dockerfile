FROM debian

RUN apt update -y && \
    apt install -y curl python2 build-essential && \
    adduser netlify --disabled-password --gecos ""

USER netlify

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash && \
    export NVM_DIR="$HOME/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    nvm install v16.4.0

USER root

RUN ln -s /home/netlify/.nvm/versions/node/v16.4.0/bin/node /usr/local/bin/node && \
    ln -s /home/netlify/.nvm/versions/node/v16.4.0/bin/npm /usr/local/bin/npm

USER netlify

RUN npm install -g netlify-cli