def happy?(num, last_nums)
  return true if num == 1
  return false if last_nums.include?(num)
  next_it = num.to_s.split('').map{|d| d.to_i ** 2 }.inject(:+)
  last_nums << num
  return happy?(next_it, last_nums)
end
# File.open(ARGV[0]).each_line do |line|
File.open('test.txt').each_line do |line|
  puts happy?(line.strip.to_i, []) ? 1 : 0
end
