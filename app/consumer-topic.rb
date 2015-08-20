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
x  = ch.topic('monitoring-alerts')
q.bind(x, routing_key: ARGV[0])

puts "Bound to topic: #{ARGV[0]}"

q.subscribe(block: true) do |delivery_info, metadata, payload|
  puts "Received #{payload}"
end

sleep 1.0
conn.close
