FROM ruby:3.0.0

RUN apt-get update && apt-get install -y git snmp

RUN cd /opt && git clone https://github.com/hatlord/snmpwn.git

RUN gem update --system \
    && gem install bundler -v 2.0

RUN cd /opt/snmpwn \
  && bundle install

WORKDIR /app

ENTRYPOINT [ "ruby", "/opt/snmpwn/snmpwn.rb" ]
