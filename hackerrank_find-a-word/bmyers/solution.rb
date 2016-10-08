test_string = ""
gets.to_i.times do |i|
  test_string << gets
end

gets.to_i.times do |i|
  puts test_string.scan(/\b#{gets.chomp}\b/).length
end
