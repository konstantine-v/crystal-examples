# High and low with two cards - This sucks
puts "Lets play a game of High or Low"
cards = (1..10).to_a.sample(2)

firstC = cards.first
lastC = cards.last

var1 = firstC < lastC
var2 = firstC > lastC
var3 = firstC < lastC
var4 = firstC > lastC

cards.each() do |i|
  puts "Make a guess, high or low?"
  guess = gets.to_s
  if (guess == "low" && var1)
    puts "foo1"
  elsif (guess == "low" && var2)
    puts "foo2"
  elsif (guess == "high" && var3)
    puts "foo3"
  elsif (guess == "high" && var4)
    puts "foo4"
  else
    puts "bar"
  end
end
