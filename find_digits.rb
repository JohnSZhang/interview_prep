def find_digits
  count = Integer(gets)
  nums = []
  count.times do |i|
    nums << Integer(gets)
  end
  nums.length.times do |j|
    puts digit_sum(nums.shift)
  end
end

def digit_sum(n)
  total = 0
  n_dup = n
  while n_dup > 0
    current_digit = n_dup % 10
    n_dup = n_dup / 10
    next if current_digit == 0
    total +=1 if n % current_digit == 0
  end
  total
end

find_digits
