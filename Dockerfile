FROM ruby:2.5

ENV FORCE_REBUILD=20190110

RUN apt-get update -y && \
   apt-get install -y \
   build-essential \
   libssl-dev \
   libyaml-dev \
   git-core \
   libpq-dev \
   libxml2-dev \
   libxslt1-dev \
   cmake \
   pkg-config \
   curl \
   libsqlite3-dev \
   libzookeeper-st-dev \
   nodejs \
   joe


ENV APP_DIR=/code
ENV APP_PORT=4000

ENV LANG=C.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=C.UTF-8

WORKDIR $APP_DIR
ADD Gemfile $APP_DIR
ADD Gemfile.lock $APP_DIR
RUN bundle install --jobs 4 --retry 3
ADD . $APP_DIR

CMD /bin/bash

