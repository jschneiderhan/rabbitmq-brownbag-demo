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
x  = ch.topic("monitoring-alerts")

i = 0
while true do
  i += 1
  puts "Publishing alerts for ##{i}"
  x.publish("DEBUG item ##{i}", routing_key: "alert.debug")
  x.publish("INFO item item ##{i}", routing_key: "alert.info")
  x.publish("ERROR item item ##{i}", routing_key: "alert.error")
  sleep 5
end

sleep 1.0
conn.close
