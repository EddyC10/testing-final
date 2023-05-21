FROM ruby:2.7.8-alpine
USER root

RUN apk update \
    && apk add --no-cache build-base \
    && apk add bash \
    && apk add sqlite-dev \
    && apk add libpq-dev \
    && apk add git \
    && apk add libc6-compat

RUN mkdir collex
WORKDIR collex

RUN gem install bundler
RUN gem install rails

COPY . .

RUN chmod 755 ./bin/server

RUN ./bin/bundle install

CMD ["./bin/server"]
