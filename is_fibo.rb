def is_fibo
  count = Integer(gets)
  nums = []
  fibs = [0, 1]
  count.times do |i|
    nums << Integer(gets)
  end
  nums.each do |num|
    add_fib(num, fibs) unless fibs[-1] >= num
    puts is_fib?(num, fibs)
  end
end

def is_fib?(num, fibs)
  fibs.include?(num) ? 'IsFibo' : 'IsNotFibo'
end

def add_fib(num, fibs)
  last_fib = fibs[-1]
  while last_fib <= num
    new_fib = last_fib + fibs[-2]
    fibs << new_fib
    last_fib = new_fib
  end
end

is_fibo
