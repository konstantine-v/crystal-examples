# Temp Convert

puts "F or C?"
unit = gets.to_s

puts "Temperature?"
temp = gets.to_s.to_f

convF = (temp - 32) * (5/9)
convC = temp * (5/9) + 32
unitF = "Fahrenheit"
unitC = "Celsius"

if (unit == "F" || "f" || "Fahrenheit")
  puts "converted " + unitF + " to " + unitC
  puts convF
elsif (unit == "C" || "c" || "Celsius")
  puts "Converted " + unitC + " to " + unitF
  puts convC
else
  puts "error"
  exit
end


