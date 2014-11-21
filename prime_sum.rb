

sum = 0
prime_count = 0
curr = 2
max_prime = 1000

def is_prime?(n, primes)
  primes.each do |i|
    if n % i == 0
      return false
    end
  end
  primes << n
  true
end

primes = []
while prime_count < max_prime
  if is_prime?(curr, primes)
    sum += curr
    prime_count += 1
  end
  curr += 1
end
puts sum
