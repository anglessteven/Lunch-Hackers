#!/bin/ruby

def split_into_columns(arr, col_count)
  return arr.each_slice(col_count).map {|a| a.fill nil, a.size, col_count - a.size}.transpose.map(&:compact)
end

def build_cipher(key)
  key_letters = key.scan(/\w/).uniq
  alphabet = ('A'..'Z').to_a
  other_letters = alphabet - key_letters
  columns = []
  new_order = split_into_columns(key_letters + other_letters, key_letters.length).sort!.flatten!
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
