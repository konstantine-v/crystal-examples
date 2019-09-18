class Testing::Fizzbuzz_2
  
  def div_fifteen(n)
		n % 15 == 0
	end
	def div_five(n)
		n % 5 == 0
	end
	def div_three(n)
		n % 3 == 0
	end

  # Alternatively you can refactor by having the if run inside the variable
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

# Another alternative, although longer, it mgiht be slightly faster
# (1..100).each do |i|
#   fb = if div_three i
#     if div_five i
#       "FizBuz"
#     else
#       "Buzz"		
#     end
#   else
#     if div_five i
#       "Fiz"
#     else
#       i
#     end
#   end
#   puts fb
# end