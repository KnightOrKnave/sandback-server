FROM ruby:slim

WORKDIR /usr/local/app

ADD ./empty_server.rb ./empty_server.rb
ADD ./ruby_dns.rb ./ruby_dns.rb
ADD ./Gemfile ./Gemfile
ADD ./run.sh ./run.sh

ENV HOSTIP 192.168.1.1

RUN apt-get update && apt-get -y install build-essential patch && bundle install && apt-get autoclean

CMD ["/bin/sh","./run.sh"]
