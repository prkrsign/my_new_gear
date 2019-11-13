# ruby2.5.1のalpineを指定
FROM ruby:2.5.1-alpine

ENV CHROME_PACKAGES="chromium-chromedriver zlib-dev chromium xvfb wait4ports xorg-server dbus ttf-freefont mesa-dri-swrast udev" \
    BUILD_PACKAGES="build-base curl-dev" \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo

# apk --update --no-cache add でインストールするパッケージを指定します
RUN apk --update --no-cache add tzdata libxml2-dev curl-dev make gcc libc-dev g++ mariadb-dev linux-headers nodejs && \
    mkdir /workdir

WORKDIR /workdir

ADD Gemfile /workdir/Gemfile
ADD Gemfile.lock /workdir/Gemfile.lock

ENV BUNDLER_VERSION 2.0.2
# && \で改行していくことにより、より軽量になるそうです
RUN gem install bundler && \
    apk upgrade && \
# Warningがでたのでここでupdateを一度入れています。
    apk update && \
    apk add --no-cache ${RUNTIME_PACKAGES} && \
    apk add --no-cache ${CHROME_PACKAGES} && \
    apk add --virtual build-packages --no-cache ${BUILD_PACKAGES} && \
    bundle install && \
    apk add --no-cache curl fontconfig && \
    curl -O https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip && \
    mkdir -p /usr/share/fonts/NotoSansCJKjp && \
    unzip NotoSansCJKjp-hinted.zip -d /usr/share/fonts/NotoSansCJKjp/ && \
    rm NotoSansCJKjp-hinted.zip && \
    fc-cache -fv && \
# 上で指定したパッケージの中、開発環境を構築したら不要になるファイルたちです。apk delで消しちゃいます。
    apk del libxml2-dev curl-dev make gcc libc-dev g++ linux-headers build-packages

ADD . /workdir
# 構築したDockerの中に入って、大きく容量をとっているディレクトリを調べました。容量が大きく不要であるcacheファイルは構築後削除しています。
RUN rm -rf /usr/local/bundle/cache/* /workdir/vendor/bundle/cache/*
