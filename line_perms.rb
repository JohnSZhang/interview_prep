def line_perm(arr)
  string = ''
  arr.permutation.to_a.each{|perm| string += perm.join('') + ","}
  string[0..-2]
end

def sort(line)
  a = line.split('').sort
end


File.open(ARGV[0]).each_line do |line|
  curr_line = line.strip
  puts line_perm(sort(curr_line))
end
