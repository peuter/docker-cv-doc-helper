FROM python:2

MAINTAINER Tobias Bräutigam

RUN apt-get update && apt-get install -y --no-install-recommends graphviz python-lxml python3-lxml openjdk-7-jdk npm
RUN wget -O plantuml.deb http://yar.fruct.org/attachments/download/362/plantuml_7707-1_all.deb
RUN dpkg -i --force-depends plantuml.deb
COPY ./utils/requirements.txt /home/app/requirements.txt
COPY ./package.json /home/app/package.json
WORKDIR /home/app
RUN pip install -r requirements.txt
RUN npm install -g grunt-cli

# goto linked externat cv dir
WORKDIR /home/cometvisu/
CMD python cv doc $OPTIONS