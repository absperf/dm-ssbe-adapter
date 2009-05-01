require 'rubygems'
require 'thin'
require 'testy'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'dm-ssbe-adapter'

require 'simple_sinatra_server'

@server = Thread.new do

  Thin::Server.start('0.0.0.0', 5050, App, :debug => false)

end unless @server

at_exit { @server.exit }

# Give the app a change to initialize
$stderr.puts "Waiting for thin to initialize..."
sleep 0.2

