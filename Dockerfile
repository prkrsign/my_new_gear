FROM ruby:2.5.1-alpine

RUN apk --update --no-cache add tzdata libxml2-dev curl-dev make gcc libc-dev g++ mariadb-dev linux-headers nodejs && \
    mkdir /workdir

WORKDIR /workdir

ADD Gemfile /workdir/Gemfile
ADD Gemfile.lock /workdir/Gemfile.lock

ENV BUNDLER_VERSION 2.0.2
RUN gem install bundler && \
    bundle install && \
    apk update && \
    apk del libxml2-dev curl-dev make gcc libc-dev g++ linux-headers

ADD . /workdir
RUN rm -rf /usr/local/bundle/cache/* /workdir/vendor/bundle/cache/*
