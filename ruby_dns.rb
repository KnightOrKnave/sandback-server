require 'rubydns'

INTERFACES = [
  [:udp, "0.0.0.0", 5300],
  [:tcp, "0.0.0.0", 5300],
]

IN = Resolv::DNS::Resource::IN

ip=ARGV[0]
if ip.nil?
    ip="192.168.1.1"
end

# Use upstream DNS for name resolution.
UPSTREAM = RubyDNS::Resolver.new([[:tcp,"localhost":53]])

p "start"
# Start the RubyDNS server
RubyDNS::run_server(INTERFACES) do
  match(%r{.*},IN::A) do |transaction|
    transaction.respond!(ip)
  end
  otherwise do |transaction|
    transaction.fail!(ip)
  end
end
