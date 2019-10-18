# Lottery game
nums = (1..99).to_a.sample(10)
puts "Enter 3 numbers seperated by spaces"
guess = gets.to_s
g = guess.split(' ').map(&.to_i)
puts nums
puts "You guess numbers", nums & g
