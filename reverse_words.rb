def reverse_words(line)
  puts line.split(' ').reverse.join(' ').strip
end

File.open(ARGV[0]).each_line do |line|
  reverse_words(line)
end

reverse_words('Hello CodeEval')
