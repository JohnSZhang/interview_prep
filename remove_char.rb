def remove_char(line)
  removable = Hash.new
  line[1].split('').each{|el| removable[el] = 1}
  char_arr = line[0].split('').select! do |char|
    char == " " || removable[char].nil?
  end
  puts char_arr.join('')
end

# File.open(ARGV[0]).each_line do |line|
File.open('test.txt').each_line do |line|
  remove_char(line.strip.split(','))
end
