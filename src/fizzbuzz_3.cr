class Testing::Fizzbuzz_3

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
    puts (i%3 == 0) ? ((i%5 == 0) ? "FizzBuzz" : "Buzz") : ((i%5 == 0) ? "Fizz" : i)
  end

end

