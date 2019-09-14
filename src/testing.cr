# TODO: Write documentation for `Testing`
module Testing
  VERSION = "0.1.0"

# Setup variables for FizzBuzz
def div_fivteen(n)
  n % 15 == 0
end
def div_fiv(n)
  n % 5 == 0
end
def div_three(n)
  n % 3 == 0
end

# First pass at FizzBuzz
(1..100).each do |i|
 fb = ""
  if div_fivteen i
    fb = "FizBuz"
  elsif div_fiv i
    fb = "Fiz"
  elsif div_three i
    fb = "Buzz"
  else
    fb = num
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

# Now with Ternary Operators, now that's minimalist
(1..100).each do |i|
 fb =
  div_fivteen i ? "fizzbuzz" :
  div_fiv i ? "fizz" :
  div_three i ? "buzz" :
  i;
 puts fb
end

end
require "./testing/*"




