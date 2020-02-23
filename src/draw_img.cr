require "stumpy_png"
require "stumpy_utils"
include StumpyPNG
#class CheckImageFoo
  #print "Specify image path: "
  #img_loc = gets.to_s
  #canvas = StumpyPNG.read(img_loc)
  ## Set to relative path since I run from the parent directory
  #r, g, b = canvas[0, 0].to_rgb8
  #puts "red=#{r}, green=#{g}, blue=#{b}"
  ## This should output the RGB values from 0,0 in the image
#end

class DrawTriangle
  canvas = Canvas.new(400, 400, RGBA::WHITE)
  # Draw Triangle
  canvas.fill_polygon [Point.new(50.0, 50.0), Point.new(50.0, 300.0), Point.new(300.0, 50.0)], RGBA::BLUE
  # Write the shape to the canvas
  StumpyPNG.write(canvas, "triangle.png")
end

class DrawSquare
  canvas = Canvas.new(400, 400, RGBA::WHITE)
  # Draw Square
  canvas.fill_polygon [Point.new(50.0, 50.0), Point.new(100.0, 50.0), Point.new(100.0, 100.0), Point.new(50.0,100.0)], RGBA::RED
  # Write the shape to the canvas
  StumpyPNG.write(canvas, "square.png")
end
