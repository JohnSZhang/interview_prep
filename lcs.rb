def lcs(lines)
  line1, line2 = lines[0].split(''), lines[1].split('')
  line1_new = (line1 - (line1 - line2)).join('')
  line2_new = (line2 - (line2 - line1)).join('')
  best = ""
  while line1_new.length > 1
    break if line1_new.length < best.length
    best_now = current_seq(line1_new, line2_new)
    best = best_now if best_now.length > best.length
    line1_new = line1_new[1..-1]
  end
  puts best.strip
end

def current_seq(l1, l2)
  curr_pos = 0
  curr2_offset = 0
  current_sub = ''
  max_length = l1.length

  while curr_pos < max_length
    curr_val = l1[curr_pos]
    if curr_val == ' '
      curr_pos += 1
      next
    end
    curr_index = l2.index(curr_val, curr2_offset)
    unless curr_index.nil?
      current_sub += curr_val
      curr2_offset = curr_index
    end
    curr_pos += 1
  end

  current_sub
end

File.open(ARGV[0]).each_line do |line|
  lcs(line.strip.split(';')) unless line.strip.length == 0
end
