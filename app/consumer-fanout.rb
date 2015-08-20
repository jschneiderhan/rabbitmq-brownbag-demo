#!/usr/bin/env ruby
# encoding: utf-8

require "rubygems"
require "bunny"

require "rubygems"
require "bunny"

conn = Bunny.new
conn.start

ch = conn.create_channel
q  = ch.queue('', :exclusive => false, :auto_delete => true)
x  = ch.fanout('challenge-completions')
q.bind(x)

q.subscribe(block: true) do |delivery_info, metadata, payload|
  puts "Received #{payload}"
end

sleep 1.0
conn.close
