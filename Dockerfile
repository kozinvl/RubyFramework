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

ENV TEST_APP_HOST=localhost
ENV TEST_PORT=3001

ENV SELENIUM_HOST=selenium
ENV SELENIUM_PORT=4444
