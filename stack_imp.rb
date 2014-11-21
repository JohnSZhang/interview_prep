
class Stack
  def self.new_stack(line)
    stack = Stack.new
    line.split(' ').each{|el| stack.push(el)}
    stack
  end

  def initialize
    @stack = []
  end

  def push(int)
    @stack << Integer(int)
  end

  def pop
    throw "theres nothing in array" unless @stack.length > 0
    @stack.pop
  end

  def print_alt
    string = " "
    count = 0
    while @stack.length > 0
      val = self.pop
      string = string + val.to_s + ' ' if count % 2 == 0
      count += 1
    end
    puts string.strip
  end
end

# File.open(ARGV[0]).each_line do |line|
File.open('test.txt').each_line do |line|
  stack = Stack.new_stack(line.strip)
  stack.print_alt
end
