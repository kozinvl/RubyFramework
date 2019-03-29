FROM ruby:2.5

RUN mkdir -p /project/bbt
WORKDIR /project/bbt

RUN apt-get update

#copy folders to workdir
COPY . .

#Install gems
RUN bundle install

#loop
ENTRYPOINT ["tail", "-f", "/dev/null"]
