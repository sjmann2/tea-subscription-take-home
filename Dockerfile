FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y postgresql-client
COPY . /tea-subscription
WORKDIR /tea-subscription
RUN gem install bundler:2.3.15 \
  && bundle config set force_ruby_platform true \
  && bundle install
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]