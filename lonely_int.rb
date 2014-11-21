#!/bin/ruby
require 'Set'
def  lonelyinteger( a)
  seen = Hash.new(nil)
  a.each do |num|
    if seen.has_key?(num)
      seen.delete(num)
    else
      seen[num] = 0
    end
  end
  puts seen.select{|k,v| v == 0 }.keys
end
a = gets.strip.to_i
b = gets.strip.split(" ").map! {|i| i.to_i}
print lonelyinteger(b)
