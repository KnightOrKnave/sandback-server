require 'webrick'

s=WEBrick::HTTPServer.new(
  :Port=>80,
  :HTTPVersion=>WEBrick::HTTPVersion.new('1.1'),
  :AccessLog=>[[open(IO::NULL,'w'),'']]
)

s.mount_proc('/') do |req,res|
  res.status=200
  res['Content-Type']='text/javascript'
  res.body="working"
end

Signal.trap('INT'){s.shutdown}
s.start
