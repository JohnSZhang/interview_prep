def lowercase(line)
  puts line.downcase
end

File.open(ARGV[0]).each_line do |line|
  lowercase(line)
end
