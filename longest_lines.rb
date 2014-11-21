longest_count = nil
lines = []

def sort_lines(lines)
  lines.sort{|line1, line2| line1.length <=> line2.length }
end

File.open(ARGV[0]).each_line do |line|
    longest_count.nil? ? longest_count = line.to_i : lines << line
end
sort_lines(lines).reverse.take(longest_count).each{ |line| puts line }
