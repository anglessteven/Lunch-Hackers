input = STDIN.read
if (input.scan(/import java/).length > 0)
  puts "Java"
elsif (input.scan(/#include/).length > 0)
  puts "C"
else
  puts "Python"
end