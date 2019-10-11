class Fizzbuzz_1
  # Setup variables for FizzBuzz
  def div_fifteen(n)
    n % 15 == 0
  end

  def div_five(n)
    n % 5 == 0
  end

  def div_three(n)
    n % 3 == 0
  end

  # Refactor of First FizzBuzz
  (1..100).each do |i|
    fb = ""
    if div_three i
      if div_five i
        fb = "FizBuz"
      else
        fb = "Buzz"
      end
    else
      if div_five i
        fb = "Fiz"
      else
        fb = i
      end
    end
    puts fb
  end
end

class Fizzbuzz_2
  # First pass at FizzBuzz
  (1..100).each do |i|
    fb = ""
    if div_fifteen i
      fb = "FizBuz"
    elsif div_five i
      fb = "Fiz"
    elsif div_three i
      fb = "Buzz"
    else
      fb = i
    end
    puts fb
  end
end

class Fizzbuzz_3
  # Alternatively you can refactor by having the if run inside the variable
  def div_fifteen(n)
    n % 15 == 0
  end

  def div_five(n)
    n % 5 == 0
  end

  def div_three(n)
    n % 3 == 0
  end

  (1..100).each do |i|
    fb = if div_fifteen i
           "FizBuz"
         elsif div_five i
           "Buz"
         elsif div_three i
           "Fiz"
         else
           i
         end
    puts fb
  end
end

class Fizzbuzz_4
  # Another alternative, although longer, it mgiht be slightly faster
  (1..100).each do |i|
    fb = if div_three i
           if div_five i
             "FizBuz"
           else
             "Buzz"
           end
         else
           if div_five i
             "Fiz"
           else
             i
           end
         end
    puts fb
  end
end

class Fizzbuzz_5
  def div_fifteen(i)
    i % 15 == 0
  end

  def div_five(i)
    i % 5 == 0
  end

  def div_three(i)
    i % 3 == 0
  end

  # Now with Ternary Operators, now that's minimalist
  (1..100).each do |i|
    # puts  (div_three) ? ((div_five) ? "FizzBuzz" : "Buzz") : ((div_five) ? "Fizz" : i)
    puts (i % 3 == 0) ? ((i % 5 == 0) ? "FizzBuzz" : "Buzz") : ((i % 5 == 0) ? "Fizz" : i)
  end
end

class Fizzbuzz_4
  # Another version I've seen for crystal, but this one I didn't do myself, it's just for reference
  1.upto(100) do |v|
    p fizz_buzz(v)
  end

  def fizz_buzz(value)
    word = ""
    word += "fizz" if value % 3 == 0
    word += "buzz" if value % 5 == 0
    word += value.to_s if word.empty?
    puts word
  end
end
