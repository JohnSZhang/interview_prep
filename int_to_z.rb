def zero_sum
  count = Integer(gets)
  nums = []
  count.times do |i|
    nums << Integer(gets)
  end
  find_zeros(nums)
end

def zero_sum2(file)
  lines = File.readlines(file)
  nums = []
  lines.each do |i|
    nums << i
  end
  find_zeros(nums[1..-1])
end



def find_zeros(nums)
  zeroes = 0
  (nums.length).times do |start|
    running_sum = nums[start]
    zeroes += 1 if running_sum == 0
    (nums.length - start - 1).times do |length|
      end_pt = start + length + 1
      running_sum = running_sum.to_i + nums[end_pt].to_i
      zeroes += 1 if running_sum == 0
    end
  end
  puts zeroes
end

zero_sum
