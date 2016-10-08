ARGF.each do |line|
  match = line.scan(/<a href="(.+?)".*?>(?:<.+?>)* *([^<]*)/)#.join(",")
  match.each { |m| puts m.join(",") }
end
