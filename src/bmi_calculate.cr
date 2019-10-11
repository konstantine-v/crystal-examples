class BmiValues
  # Variables
  possible_genders = ["Male", "Female"]   # For BMI, don't get mad
  possible_units = ["Imperial", "Metric"] # Prompt user for type of units
  # Set Defaults
  set_height = 5.11 # Feet
  set_weight = 180  # Pounds
  # set_name = nil
  set_gender = possible_genders.first
  set_unit_of_measure = possible_units.first

  puts "Lets Calculate your BMI"

  print "Enter your name:"
  # set_name = gets.try(&.to_s) || nil
  set_name = gets.to_s.chomp

  # if (set_name != "" || set_name != nil || set_name != " ")
  if set_name.not_nil!
    puts "Hello, #{set_name}"
  else
    puts "Nothing put, setting name to Bob"
    set_name = "Bob"
  end

  print "Are you using Imperial or Metric?"
  set_unit_of_measure = gets.not_nil!.to_s
  if set_unit_of_measure
  else
    puts "Nothing put or inccorrect imput, Defaulting to Imperial"
    set_unit_of_measure = possible_units.first
  end

  # Imperial
  if (set_unit_of_measure === possible_units.first)
    print "Type your Height in Feet (ex. 5.11 for 5 Feet 11 Inches):"
    set_height = gets.try(&.to_f) || 0
    set_height_in = set_height * 12

    print "Type your Weight in Pounds (ex. 180):"
    set_weight = gets.try(&.to_i) || 0

    total_BMI = (set_weight / (set_height_in * set_height_in)) * 703
    # Metric
  elsif (set_unit_of_measure === possible_units.last)
    print "Type your Height in centimeters (ex. 155):"
    set_height = gets.try(&.to_i) || 0

    print "Type your Weight in Kilos (ex. 81):"
    set_weight = gets.try(&.to_i) || 0

    total_BMI = set_weight / (set_height * set_height)
  else
    puts "Error, not sure what happened, try again..."
    exit
  end

  if (total_BMI < 18.5)
    bmi_string = "Underweight"
  elsif (total_BMI < 29.9 && total_BMI > 18.5)
    bmi_string = "Normal"
  elsif (total_BMI < 29.9 && total_BMI > 18.5)
    bmi_string = "Overweight"
  elsif (total_BMI > 30)
    bmi_string = "Obese"
  end

  # Print Outputs - Include Chart with output
  puts "Hello #{set_name}"
  puts "Your BMI is: #{total_BMI}"
  puts "You're considered: #{bmi_string}"
end
