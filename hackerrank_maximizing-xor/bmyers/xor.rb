#!/usr/bin/ruby

def maxXor(l, r)
  max = 0
  (l..r).each do |left|
    (left..r).each do |right|
      value = left ^ right
      max = value if value > max
    end
  end
  return max
end

l = gets.to_i
r = gets.to_i
print maxXor(l, r)
