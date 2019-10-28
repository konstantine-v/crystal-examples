require "admiral"

class BmiValues < Admiral::Command
  define_flag name : String, long: name
  define_flag units : String, default: "Imperial", long: units
  define_flag height : Float64, default: 5.11, long: height
  define_flag weight : Int32, default: 180, long: height

  def run
    if (flags.name != nil)
      puts "Hello #{flags.name}!"
    end
    puts "Calculating BMI..."

    if (flags.units != nil)
      calc_height = flags.height * 12
      total_BMI = (flags.weight / (calc_height * calc_height)) * 703

      if (total_BMI < 18.5)
        bmi_string = "Underweight"
      elsif (total_BMI < 29.9 && total_BMI > 18.5)
        bmi_string = "Normal"
      elsif (total_BMI < 29.9 && total_BMI > 18.5)
        bmi_string = "Overweight"
      elsif (total_BMI > 30)
        bmi_string = "Obese"
      end

      puts "Your BMI is: #{total_BMI}"
      puts "You're considered: #{bmi_string}"
    else
      puts "Error, not sure what happened, try again..."
      exit
    end

  end
end


BmiValues.run