def is_prime?(n)
  (n/2).times do |num|
    if n % (num+2) == 0
      return false
    end
  end
  true
end

def is_pali?(num)
  num.to_s.reverse == num.to_s
end
max = 1000

while true
  if is_prime?(max) && is_pali?(max)
    puts max
    break
  end
  max -= 1
end
