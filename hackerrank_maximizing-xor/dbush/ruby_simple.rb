#!/usr/bin/ruby

lowerbound = gets.to_i
upperbound = gets.to_i
max_value = 0

(lowerbound..upperbound).each do |first|
    (lowerbound..upperbound).each do |last|
        max_value = [max_value, first ^ last].max
    end
end

print max_value
