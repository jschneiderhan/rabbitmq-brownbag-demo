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

q.subscribe(block: true) do |delivery_info, metadata, payload|
  puts "Received #{payload}"
end

sleep 1.0
conn.close
