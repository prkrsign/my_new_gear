FROM ruby:2.5.1-alpine


RUN apk --update --no-cache add wine shadow sudo busybox-suid mariadb-dev tzdata alpine-sdk linux-headers

RUN mkdir /workdir
WORKDIR /workdir

ADD Gemfile /workdir/Gemfile
ADD Gemfile.lock /workdir/Gemfile.lock

ENV BUNDLER_VERSION 2.0.2
RUN gem install bundler && \
    bundle install && \
    

ADD . /workdir
