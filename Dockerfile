FROM openjdk:11-jdk

ENV DEBIAN_FRONTEND=noninteractive

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - &&\
    apt-get update &&\
    apt-get install -y nodejs libgtk-3-0 libx11-xcb-dev libdbus-glib-1-2 libxt-dev &&\
    rm -rf /var/lib/apt/lists/*

RUN wget -O FirefoxSetup.tar.bz2 "https://download.mozilla.org/?product=firefox-latest&os=linux64" &&\
    tar xjf FirefoxSetup.tar.bz2 -C /opt/ &&\
    rm FirefoxSetup.tar.bz2 &&\
    ln -s /opt/firefox/firefox /usr/local/bin/firefox

RUN firefox --version --headless
