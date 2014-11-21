def fizz_buzz(line)
  args = line.split(' ').map(&:to_i)
  first, second, count = args[0], args[1], args[2]
  curr = 1
  result = ""
  while curr <= count
    if curr % first == 0 && curr % second == 0
      result += "FB"
    elsif curr % first == 0
      result += "F"
    elsif curr % second == 0
      result += "B"
    else
      result+= curr.to_s
    end
    result += " "
    curr += 1
  end
  puts result.strip
end

File.open(ARGV[0]).each_line do |line|
  fizz_buzz(line)
end
