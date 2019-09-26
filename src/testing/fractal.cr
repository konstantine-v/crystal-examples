require "stumpy_png"

module Fractals
  # Code Here

  # Render test code in stumpy_png

  canvas = StumpyPNG.read("img/foo.png")
  # Set to relative path since I run from the parent directory
  r, g, b = canvas[0, 0].to_rgb8
  puts "red=#{r}, green=#{g}, blue=#{b}"
  # This should output the RGB values from 0,0 in the image.

  # Define positions, min max, etc
  # Create classes for Mandelbrot and Julia
  # Render code in stumpy_png

end