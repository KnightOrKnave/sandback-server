#/bin/bash

echo "start"
echo *${HOSTIP}*

ruby /opt/ruby_dns.rb $HOSTIP &
ruby /opt/empty_server.rb
echo "end"
