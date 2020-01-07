require "stumpy_png"
require "stumpy_utils"
include StumpyPNG

# Generate Random Circle based artwork

module ArtGenerator
  def self.new(x, y)
    canvas = Canvas.new(x, y) { |x, y| RGBA.from_rgb_n(x, y, 255, 8) }
    
    ran_am = Random.new.rand(1..10)
    colors = Array.new(ran_am) {
      RGBA.from_rgb_n(
        Random.new.rand(1..y), 
        Random.new.rand(1..y), 
        255, 8
      )
    }

    colors.each_with_index do |color, i|
      radius = (colors.size - i) * Random.new.rand(10..30)
      canvas.circle(Random.new.rand(1..x), Random.new.rand(1..y), radius, color, true)
    end

    (colors.size * 2).times do |i|
      radius = ((colors.size * 2) - i) * Random.new.rand(10..30)
      canvas.circle(Random.new.rand(1..x), Random.new.rand(1..y), radius, RGBA::BLACK, false)
    end
    StumpyPNG.write(canvas, "circles.png")
  end
end

ArtGenerator.new(255, 255)