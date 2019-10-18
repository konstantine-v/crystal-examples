puts "Age?"
age = gets.to_s.to_i

ageMonths = age * 12
ageWeeks = age * 52
ageDays = age * 365
ageHours = ageDays * 24
ageMinutes = ageHours * 60
ageSeconds = ageMinutes * 60

if (age != nil)
  print "Months: "
  puts ageMonths.to_i
  print "Weeks: "
  puts ageWeeks.to_i
  print "Days: "
  puts ageDays.to_i
  print "Hours: "
  puts ageHours.to_i
  print "Minutes: "
  puts ageMinutes.to_i
  print "Seconds: "
  puts ageSeconds.to_i
else
  puts "error"
end
