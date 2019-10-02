
class BmiCalulate
  
end

class BmiValues

  # Allow for user input
  # Change set to get once inputs are created

  possible_genders = ["Male", "Female"] # For BMI, don't get mad
  set_gender = possible_genders.first()
  set_age = 23
  possible_units = ["Imperial", "Metric"] # Prompt user for type of units
  set_unit_of_measure = possible_units.first()

  # Hardcode values in for testing
  if (set_unit_of_measure == "Imperial") {
    set_height = 5.11       # Feet
    set_weight = 180        # Pounds
    set_height_in = set_height * 12
    total_BMI = (set_weight / (set_height_in * set_height_in)) * 703
  } elsif (set_unit_of_measure == "Metric") {
    set_height = 155.7528   # Centimeters
    set_weight = 81.648     # Kilos
    total_BMI = set_weight / (set_height_in * set_height_in)
  } else {
    puts "error"
    break
  }

  # Convert imp to metric for whatever reason
  # set_height_metric = set_height * 2.54
  # set_weight_metric = set_weight * 0.4536

  # Print Outputs - Include Chart with output
  puts "Below 18.5 =	Underweight"
  puts "18.5 - 24.9 =	Normal"
  puts "25 - 29.9 =	Overweight"
  puts "30.0 + =	Obese"
  puts "======================"
  puts " Your BMI is: #{total_BMI}"

  # Advanced:
    # Allow for outputting all data input into JSON format
    # Add Calculations for Male and Female added

end