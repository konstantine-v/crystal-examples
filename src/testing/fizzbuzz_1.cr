class Testing::Fizzbuzz_1

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

# First pass at FizzBuzz
# (1..100).each do |i|
# 	fb = ""
# 	if div_fifteen i
# 		fb = "FizBuz"
# 	elsif div_five i
# 		fb = "Fiz"
# 	elsif div_three i
# 		fb = "Buzz"
# 	else
# 		fb = i
# 	end
# 	puts fb
# end