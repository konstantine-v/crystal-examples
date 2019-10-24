# Simple Love Calculator
puts "Enter your name:"
yname = gets.to_s.downcase.count("a-z")
puts "Enter your partner's name:"
pname = gets.to_s.downcase.count("a-z")

if (yname === pname)
  yname = yname*2
  pname = pname*2
end

ynameleng = (yname * 2)
pnameleng = (pname * 2)

loveperc = (ynameleng + pnameleng) *2
if (loveperc > 100)
  loveperc = 100
end

puts "Your love percentage is: #{loveperc}%"
