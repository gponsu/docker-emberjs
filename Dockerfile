FROM node:6.7.0
MAINTAINER Vicente Pons <simpons@gmail.com>

ENV EMBERCLI_VERSION 2.8.0
ENV BOWER_VERSION 1.7.9
ENV PHANTOMJS_VERSION 2.1.12

RUN \
	npm install -g ember-cli@"$EMBERCLI_VERSION" &&\
	npm install -g bower@"$BOWER_VERSION" &&\
	npm install -g phantomjs-prebuilt@"$PHANTOMJS_VERSION"

RUN \
	apt-get update &&\
	apt-get install -y autoconf automake build-essential python-dev &&\
	git clone https://github.com/facebook/watchman.git &&\
	cd watchman &&\
	./autogen.sh &&\
	./configure &&\
	make &&\
	make install
