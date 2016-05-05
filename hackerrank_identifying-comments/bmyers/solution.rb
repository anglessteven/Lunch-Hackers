STDIN.read.scan(/((?:\/\/[^\n]*?(?=\n))|(?:\/\*(?:.|\n)*?\*\/))/).each do |arr|
  arr.each do |comment|
    puts comment.gsub(/\n +/, "\n")
  end
end
