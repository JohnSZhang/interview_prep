def sum_digit(line)
  puts line.split('').map(&:to_i).inject(:+)
end

File.open(ARGV[0]).each_line do |line|
  sum_digit(line)
end
