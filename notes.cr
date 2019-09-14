# Crystal programming Notes

# Writing these notes for myself to reference and remember. I'm going through a lesson guide currently and I'm trying to write as verbose as possible without repeating much.
# In future notes I may just put it in a crystal file so that way people can run it themselves locally or through the browser.
# I'm going to avoid just copying everything from the Docs, just practicing some here and there and making note of interesting bits.

# Setting variables and classes
# Marking the classes with class and then CamalCase class name

class WrapperClass
  @x : String
  @e : Int32
  @y : Int32 | String
  
  # The : signifies that you're showing the type of a variable
  # The = means your setting a variable, much like other languages

  # Define the function, initialize and 
  def initialize
    @x = "osman"
    @e = 1
    @y = 1
    @y = "osman"

    puts @x
    puts @e
    puts @y
  end
end

# Outputs

# osman
# 1
# osman

# Variable y is overwritten by the second declaration of it, ie. y="string" 


# While loops and such
#
# While loops

a = nil
while true
  a = 1
  break
end
puts a 
# outputs 1

while true
  b = 1
  break
end
puts b #  1

while c = 1
  break
end
puts c # 1

# if else

if (num = 9) < 0
  puts "#{num}, is negative"
elsif num < 10
  puts "#{num}, has 1 digit"
else
  puts "#{num}, has multiple digits"
end

# This is an example if you want to test a loop out, set the variable within the loop and check if the output comes out as expected.

# You can require code defined in other files:

require "http/server"

# (Much like in javascript frameworks liek react)


# Interpolation

# A string literal with interpolation allows to embed expressions into the string which will be expanded at runtime.

a = 1
b = 2
"sum: #{a} + #{b} = #{a + b}" # => "sum: 1 + 2 = 3"


# Security concerns
# While command literals may prove useful for simple script-like tools, special caution is advised when interpolating user input because it may easily lead to command injection.

user_input = "hello; rm -rf *"
echo #{user_input}


# Assignment
# Assignment is done using the equals sign (=).

# Assigns to a local variable
local = 1

# Assigns to an instance variable
@instance = 2

# Assigns to a class variable
@@class = 3


# Some syntax sugar that contains the = character is available:

local += 1 # same as: local = local + 1
# The above is valid with these operators:
# +, -, *, /, %, |, &, ^, **, <<, >>

local ||= 1 # same as: local || (local = 1)
local &&= 1 # same as: local && (local = 1)

# Chaining Assignment

a = b = c = 123

# Now a, b and c have the same value:
a # => 123
b # => 123
c # => 123

# The chained assignment is not only available to local variables but also to instance variables, class variables and setter methods (methods that end with =).

# Multiple Assignments

name, age = "Crystal", 1

# The above is the same as this:

temp1 = "Crystal"
temp2 = 1
name  = temp1
age   = temp2

# Local variables
# Local variables start with lowercase letters. They are declared when you first assign them a value.

name = "Crystal"
age = 1

# Elsif/if

if some_condition
  do_something
elsif some_other_condition
  do_something_else
else
  do_that
end

# The ternary if allows writing an if in a shorter way:

a = 1 > 2 ? 3 : 4

# The above is the same as:
a = if 1 > 2
      3
    else
      4
    end


