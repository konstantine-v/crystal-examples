
# Hello World
a = true

while a = true
  a = "Hello World"
  break
end

puts a


def div_fivteen(n)
  n % 15 == 0
end
def div_fiv(n)
  n % 5 == 0
end
def div_three(n)
  n % 3 == 0
end

(1..100).each do |i|
 answer = ""
  if div_fivteen i
    answer="FizBuz"
  elsif div_fiv i
    answer="Fiz"
  elsif div_three i
    answer="Buzz"
  else
    answer = num
  end
  puts answer
end

# Alternatively you can refactor by having the if run inside the variable
(1..100).each do |i|
  fb = if div_fivteen i
    "FizBuz"
  elsif div_three i
    "Fiz"
  elsif div_fiv i
    "Buz"
  else
    i
  end
  puts fb
end

# Now with Ternary Operators
(1..100).each do |i|
 fb =
  div_fivteen i ? "fizzbuzz" :
  div_fiv i ? "fizz" :
  div_three i ? "buzz" :
  i
 puts fb
end
