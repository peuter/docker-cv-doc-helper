FROM python:3.8-buster

MAINTAINER Tobias Bräutigam

# Latest Google Chrome installation package
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    python-lxml \
    graphviz \
    plantuml \
    curl \
    xvfb \
    libgconf-2-4 \
    xauth \
    google-chrome-stable \
    build-essential\
    nodejs\
    python-enchant

RUN apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY ./CometVisu/utils/requirements.txt /home/app/requirements.txt
COPY ./CometVisu/package.json /home/app/package.json
WORKDIR /home/app
RUN pip install -r requirements.txt
RUN npm install -g grunt-cli easyimage

ENV NODE_PATH /usr/lib/node_modules
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null

# goto linked external cv dir
WORKDIR /home/cometvisu/
CMD $COMMAND
