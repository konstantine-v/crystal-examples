class Testing::Fizzbuzz_4

	# Another version I've seen for crystal, but this one I didn't do myself, it's just for reference
	1.upto(100) do |v|
		p fizz_buzz(v)
	end
	
	def fizz_buzz(value)
		word = ""
		word += "fizz" if value % 3 == 0
		word += "buzz" if value % 5 == 0
		word += value.to_s if word.empty?
		word
	end

end
