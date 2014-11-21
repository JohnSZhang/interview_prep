def rotate?(lines)
  l1, l2 = lines[0], lines[1]
  len1 = l1.length
  len2 = l2.length
  len1.times do |offset|
    is_rotate = true
    len1.times do |char_idx|
      if l2[char_idx] != l1[(char_idx + offset) % len1]
        is_rotate = false
        break
      end
    end
    return true if is_rotate
  end
  return false
end

# File.open(ARGV[0]).each_line do |line|
File.open('test.txt').each_line do |line|
  puts rotate?(line.strip.split(',')) ? "True" : "False"
end
