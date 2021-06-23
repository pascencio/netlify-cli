FROM debian

RUN apt update -y && \
    apt install -y curl python2 && \
    adduser netlify --disabled-password --gecos ""

USER netlify

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash && \
    export NVM_DIR="$HOME/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    nvm install node && \
    npm install -g netlify-cli
