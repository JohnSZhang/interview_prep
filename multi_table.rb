row = 1
column = 1
string = ''
def add_num(string, num)
  if num < 10
    string += '   ' + num.to_s
  elsif num < 100
    string += '  ' + num.to_s
  else
    string += ' ' + num.to_s
  end
  string
end
while row < 13
  line = ""
  while column < 13
    line = add_num(line, row * column)
    column += 1
  end
  column = 1
  line = row < 10 ? line[1..-1] : line[1..-1]
  puts line
  row += 1
end
