FROM ruby:2.4.0

ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN wget https://nodejs.org/dist/v6.10.0/node-v6.10.0-linux-x64.tar.xz
RUN tar -C /usr/local --strip-components 1 -xJf node-v6.10.0-linux-x64.tar.xz
RUN gem uninstall -i /usr/local/lib/ruby/gems/2.4.0 bundler rake
RUN gem install bundler

ENV APP_HOME /make_docker_rails

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock
RUN bundle install --jobs=3 --retry=3

COPY . $APP_HOME
