FROM docker.artifactory.weedon.org.au/redwyvern/ubuntu-base:focal
MAINTAINER Nick Weedon <nick@weedon.org.au>

RUN curl --silent -k 'https://dl-ssl.google.com/linux/linux_signing_key.pub' | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list

RUN curl --silent -k 'https://deb.nodesource.com/gpgkey/nodesource.gpg.key' | apt-key add - && \
    printf "deb http://deb.nodesource.com/node_15.x xenial main\ndeb-src http://deb.nodesource.com/node_15.x xenial main\n" >/etc/apt/sources.list.d/nodesource.list

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"

RUN apt-get clean && apt-get update && apt-get install -y --no-install-recommends \
    bzip2 \
    nodejs \
    git \
    unzip \
    python \
    xml2 \
    xvfb \
    libxi6 \
    libgconf-2-4 \
    libnss3-dev \
    hicolor-icon-theme \
    build-essential \
    dh-make \
    fakeroot \
    devscripts \
    docker-ce \
    google-chrome-stable && \
    apt-get -q autoremove && \
    apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin

RUN npm install -g \
    bower \
    grunt \
    less \
    yarn \
    semver


