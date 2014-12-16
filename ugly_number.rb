
def ugly_numbers(line)
  uglies = Hash.new(nil)
  expressions = [line[0]]
  length = line.strip.length
  for i in 1..length-1
    new_expressions = []
    expressions.each do |exp|
      new_expressions << exp + "+#{line[i]}"
      new_expressions << exp + "-#{line[i]}"
      new_expressions << exp + "#{line[i]}"
    end
    expressions = new_expressions
  end
  puts test_uglies(expressions, uglies)
end


def test_uglies(exps,uglies)
  count = 0
  nums = []
  exps.each do |exp|
    total = eval_ugly(exp)
    if is_ugly?(total,uglies)
      count += 1
    end
  end
  count
end

def eval_ugly(exp)
  nums = exp.split(/\-|\+/)
  operators = exp.split(/[0-9]+/)
  sum = Integer(nums[0], 10)
  for i in 1..nums.length-1
    sum = sum.send(operators[i], Integer(nums[i]))
  end
  sum
end

def is_ugly?(num, uglies)
  primes = [2, 3, 5, 7]
  if uglies[num].nil?
    if primes.any? {|prime| num % prime == 0 }
      uglies[num] = true
    else
      uglies[num] = false
    end
  end
  uglies[num]
end


# File.open(ARGV[0]).each_line do |line|
File.open('test.txt').each_line do |line|
  ugly_numbers(line)
end
