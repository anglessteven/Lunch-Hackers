#!/bin/ruby

def build_cipher(key)
  key_letters = key.scan(/\w/).uniq
  alphabet = ('A'..'Z').to_a
  other_letters = alphabet - key_letters
  columns = []
  new_order = key_letters + other_letters
  new_order = new_order.each_slice(key_letters.length).map {|a| a.fill nil, a.size, key_letters.length - a.size}.transpose.map(&:compact)
  new_order.sort!.flatten!
  cipher = {' ' => ' '}
  new_order.zip(alphabet).each { |k, v| cipher[k] = v }
  return cipher
end

tests = gets.strip.to_i

tests.times do |t|
  cipher = build_cipher(gets.chomp)
  gets.chomp.each_char { |n| print cipher[n] || n }
  puts
end
