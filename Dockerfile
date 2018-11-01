FROM ruby:2.5.3

ENV RAILS_ENV production
ENV DATABASE_URL 'postgres://postgres:@db/awesome_broker'

RUN apt-get update && apt-get -y install cron
ADD crontab /etc/cron.d/sync-cron
RUN chmod 0644 /etc/cron.d/sync-cron && touch /var/log/cron.log
CMD cron && tail -f /var/log/cron.log

ENV NODE_VERSION 6.6.0
RUN \
  curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" \
  && sha256sum node-v$NODE_VERSION-linux-x64.tar.xz \
  && echo "fdf4377ea4dc9ba2f09d81d9ad1eae42e7eb870c4b1b69f2761f22f28cb5ba31  node-v$NODE_VERSION-linux-x64.tar.xz" | sha256sum -c - \
  && tar -xJf "node-v$NODE_VERSION-linux-x64.tar.xz" -C /usr/local --strip-components=1 \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
  && rm node-v$NODE_VERSION-linux-x64.tar.xz

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

COPY vendor /app/vendor

RUN bundle install --without development test

COPY . /app

RUN bin/rake assets:precompile
