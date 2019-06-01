FROM ruby:2.5

WORKDIR /project/bbt
RUN apt-get update
COPY Gemfile /project/bbt
RUN bundle install

#loop
#ENTRYPOINT ["tail", "-f", "/dev/null"]
