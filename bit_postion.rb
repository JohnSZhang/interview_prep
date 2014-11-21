def bit_post(args)
  number, p1, p2 = args[0].to_i, args[1].to_i, args[2].to_i
  if bit(number, p1) == bit(number, p2)
    puts 'true'
  else
    puts 'false'
  end
end

def bit(num, pos)
  num % (2 ** (pos)) >= 2 ** (pos - 1)
end


File.open(ARGV[0]).each_line do |line|
  bit_post(line.split(','))
end
