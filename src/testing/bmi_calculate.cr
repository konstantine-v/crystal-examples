
class BmiCalulate

  if (set_weight === "Male") {
    total_BMI = (set_weight * 703) / (set_height * set_height)
  } elsif (set_weight === "Male") {
    total_BMI = (set_weight * 703) / (set_height * set_height)
  } else {
    total_BMI = "Error, something went wrong..."
  }
  
end

class BmiValues

  possible_genders = ["Male", "Female"] #For BMI, don't get mad
  set_gender = "Male"
  set_age    = "23"
  set_height = "5.11"
  set_weight = "180"

  puts "Below 18.5 =	Underweight"
  puts "18.5 - 24.9 =	Normal"
  puts "25 - 29.9 =	Overweight"
  puts "30.0 + =	Obese"
  puts "======================"
  puts " Your BMI is: #{total_BMI}"

end