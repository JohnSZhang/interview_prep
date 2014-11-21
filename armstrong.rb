def armstrong(line)
  pow = line.length
  sum = line.split('').map(&:to_i).map{|el| el ** pow }.inject(:+)
  puts line.to_i == sum ? "True" : "False"
end

# File.open(ARGV[0]).each_line do |line|
File.open('test.txt').each_line do |line|
  armstrong(line.strip)
end
