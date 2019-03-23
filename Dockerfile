FROM ruby:2.5

RUN mkdir -p /project/bbt
WORKDIR /project/bbt

RUN apt-get update

#copy folder to workdir
#in progress
COPY ./bin ./bin
COPY ./features ./features
COPY ./helpers ./helpers
COPY ./lib ./lib
COPY ./page ./page

#Install gems
COPY Gemfile ./
COPY Gemfile.lock ./
RUN bundle install

#loop
ENTRYPOINT ["tail", "-f", "/dev/null"]