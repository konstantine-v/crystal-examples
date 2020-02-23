class Haiku::Random
  def initialize
    rand_words = [
      "He",
      "Water",
      "From",
      "Calls",
      "Spirit",
      "It",
      "To",
      "Within",
      "Travels",
      "Weather",
      "Peter",
    ]
  end

  def run(n = 2)
    (0..n).each | do |
      print rand_words[n] + ", "
  end
end

class Haiku::Structure
  def initialize
    Haiku::Random.run
  end
end

Haiku::Structure.new

class Haiku::Gen
end

# class Haiku
#   def run
#     puts "Your New Haiku...."
#     Haiku::Gen.new(type)
#   end
# end

# Haiku.run
