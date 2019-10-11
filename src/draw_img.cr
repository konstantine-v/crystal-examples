require "stumpy_png"

class CheckImageFoo
  canvas = StumpyPNG.read("img/foo.png")
  # Set to relative path since I run from the parent directory
  r, g, b = canvas[0, 0].to_rgb8
  puts "red=#{r}, green=#{g}, blue=#{b}"
  # This should output the RGB values from 0,0 in the image.

end

class DrawImgRainbow
  include StumpyPNG
  canvas = Canvas.new(256, 256)
  (0..255).each do |x|
    (0..255).each do |y|
      # RGBA.from_rgb_n(values, bit_depth) is an internal helper method
      # that creates an RGBA object from a rgb triplet with a given bit depth
      color = RGBA.from_rgb_n(x, y, 255, 8)
      canvas[x, y] = color
    end
  end
  StumpyPNG.write(canvas, "rainbow.png")
end
