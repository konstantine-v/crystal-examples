maleNames = [ "Aaron", "Abdul", "Abe", "Abel", "Abraham", "Adam", "Adan", "Adolfo", "Adolph", "Adrian" ]
femaleNames = [ "Abby", "Abigail", "Adele", "Adrian" ]
genNueNames = [ "Zed", "Zabbi", "Xorbo", "Bingos", "ChungChung", "Bungus" ]
lastNames = [ "Abbott", "Acosta", "Adams", "Adkins", "Aguilar" ]

femName = femaleNames.sample() + " " + lastNames.sample()
maleName = maleNames.sample() + " " + lastNames.sample()
gnName = genNueNames.sample() + " " + lastNames.sample()

puts "This is a name generator"
puts "Are you boy or girl?"
nameInput = gets.to_s
if (nameInput == "girl" || nameInput == "Girl")
  puts femName
elsif (nameInput == "boy" || nameInput == "Boy")
  puts maleName
else
  puts gnName
end