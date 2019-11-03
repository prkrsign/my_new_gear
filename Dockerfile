# ruby2.5.1のalpineを指定
FROM ruby:2.5.1-alpine

# apk --update --no-cache add でインストールするパッケージを指定します
RUN apk --update --no-cache add tzdata libxml2-dev curl-dev make gcc libc-dev g++ mariadb-dev linux-headers nodejs && \
    mkdir /workdir

WORKDIR /workdir

ADD Gemfile /workdir/Gemfile
ADD Gemfile.lock /workdir/Gemfile.lock

ENV BUNDLER_VERSION 2.0.2
# && \で改行していくことにより、より軽量になるそうです
RUN gem install bundler && \
    bundle install && \
# Warningがでたのでここでupdateを一度入れています。
    apk update && \
# 上で指定したパッケージの中、開発環境を構築したら不要になるファイルたちです。apk delで消しちゃいます。
    apk del libxml2-dev curl-dev make gcc libc-dev g++ linux-headers

ADD . /workdir
# 構築したDockerの中に入って、大きく容量をとっているディレクトリを調べました。容量が大きく不要であるcacheファイルは構築後削除しています。
RUN rm -rf /usr/local/bundle/cache/* /workdir/vendor/bundle/cache/*
