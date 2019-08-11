FROM ruby:slim
MAINTAINER Admin <admin@admin.com>

ADD ./empty_server.rb /opt/empty_server.rb
ADD ./ruby_dns.rb /opt/ruby_dns.rb
ADD ./run.sh /opt/run.sh

ENV HOSTIP 192.168.1.1

RUN gem install webrick
RUN gem install rubydns

CMD ["/bin/sh","/opt/run.sh"]
