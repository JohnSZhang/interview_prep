def multiples(args)
  max, multiple = args[0].to_i, args[1].to_i
  count = 1
  while multiple * count < max
    count += 1
  end
  puts multiple * count
end

File.open(ARGV[0]).each_line do |line|
  multiples(line.split(','))
end
