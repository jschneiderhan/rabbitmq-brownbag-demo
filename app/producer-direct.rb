#!/usr/bin/env ruby
# encoding: utf-8

require "rubygems"
require "bunny"

require "rubygems"
require "bunny"

conn = Bunny.new
conn.start

ch = conn.create_channel
q  = ch.queue("myh.work-items")
x  = ch.default_exchange

i = 0
while true do
  i += 1
  puts "Publishing Work Item ##{i}"
  x.publish("Work item ##{i}", :routing_key => q.name)
  sleep 5
end

sleep 1.0
conn.close
