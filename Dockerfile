FROM ruby:2.5-alpine3.7

ENV HOST 0.0.0.0
ENV APP_ROOT /app
WORKDIR ${APP_ROOT}

RUN apk add --no-cache --update \
  alpine-sdk sqlite-dev
ADD gems.rb gems.locked ${APP_ROOT}/

RUN bundle install --without development

EXPOSE 9292
VOLUME ${APP_ROOT}/db

ADD . ${APP_ROOT}

ENTRYPOINT bundle exec rackup --host ${HOST}
CMD tail -f /var/log/syslog