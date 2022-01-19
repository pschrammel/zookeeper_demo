ZOOKEEPERS=ENV["ZOOKEEPERS"]

puts "ZOOKEEPERS: #{ZOOKEEPERS}"
sleep 5
require 'config_watcher'
CONFIG_WATHERS=[]

watcher=ConfigWatcher.new
CONFIG_WATHERS << watcher
watcher.subscribe

puts "subscribed"

