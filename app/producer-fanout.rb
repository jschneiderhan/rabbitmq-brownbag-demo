#!/usr/bin/env ruby
# encoding: utf-8

require "rubygems"
require "bunny"

require "rubygems"
require "bunny"

conn = Bunny.new
conn.start

ch = conn.create_channel
x  = ch.fanout('challenge-completions')

i = 0
while true do
  i += 1
  puts "User ##{i} completed their challenge"
  x.publish("Work item ##{i}")
  sleep 5
end

sleep 1.0
conn.close
