FROM ruby:2.6.5

RUN apt-get update
WORKDIR /project/bbt
COPY Gemfile /project/bbt
RUN bundle install