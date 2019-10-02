require "stumpy_png"
require "option_parser"

module Fractals

  private def drag(pos, pos_min, pos_max, out_min, out_max)
    return (
      (pos - pos_min) * (out_max - out_min) /
      (pos_max - pos_min) + out_min
    )
  end

  class Mandelbrot
    property :colouring
    private def initialize(image)
      @width, @height = image.width, image.height
      @image = image
    end
    private def calculate(a, b, c_arr)
      ca, cb = c_arr
      left = a * a - b * b
      right = 2 * a * b
      a = left  + ca
      b = right + cb
      return [a, b]
    end
    private def draw(definition=255, scale=2.0, offset=[0,0])
      scaleWidth  = scale
      scaleHeight = scale.to_f * (@height.to_f // @width.to_f)
      definition = definition.to_f
      (0..@width - 1).each do |x|
        (0..@height - 1).each do |y|
          a = ca = drag x, 0, @width,  -scaleWidth  + offset[0], scaleWidth  + offset[0]
          b = cb = drag y, 0, @height, -scaleHeight - offset[1], scaleHeight - offset[1]
          snap = 0
          while snap < definition
            a, b = calculate a, b, [ca, cb]
            if a * a + b * b > 16
              break
            end
            snap += 1
          end
          case @colouring
          when "multichromatic", "multi", "rainbow"
            brightness = 1
            brightness = 0 if snap == definition
            hue = drag snap, 0, definition, 0, 1
            hue = drag (Math.sqrt hue), 0, 1, 0, 360
            @image[x, y] = StumpyPNG::Color.from_hsv hue, 1, brightness
          else
            shade = drag snap, 0, definition, 0, 1
            shade = drag (Math.sqrt shade), 0, 1, 0, 255
            r, g, b = [shade.round.to_i] * 3
            @image[x, y] = StumpyPNG::Color.rgb r, g, b
          end
        end
      end
      return @image
    end
  end
  class Julia < Mandelbrot
    property :real
    property :imaginary
    private def calculate(a, b, c_arr)
      left = a * a - b * b
      right = 2 * a * b
      a = left  + @real      # z^2 + c
      b = right + @imaginary
      return [a, b]
    end
  end

end

# Hardcode the the parameters to benchmark the application.
# Remember, to add Optarg to add crystal cli args: (https://github.com/mosop/optarg)

allowed_fractals = "mandelbrot"
fractal_type = String.new
fractal_type = "mandelbrot"

o = "mandelbrot benchmark.png"

if fractal_type.empty?
  puts "Error: Please provide a fractal type.\nType `fractal --help` for help."
  exit 1
end

width = height = 0
width  = 1920
height = 1080

if width <= 0 || height <= 0
  puts "Warning, width and/or height not provided.\nSetting to default: 300x300"
  width = height = 300
end

ca = cb = nil
if args.key? "complex"
  complex = args["complex"]
  ca, cb = complex.split(/(?=[+\-])/)
  ca = ca.to_f
  cb.delete! "i"
  cb = cb.to_f
end

if fractal_type == "julia" && (ca.nil? || cb.nil?)
  puts "Error: fractal type: '#{fractal_type}' requires complex coordinate,\n in form of '±c₁±c₂i', for example: -0.416+0.8i"
  exit 1
end

png = ChunkyPNG::Image.new width, height

case fractal_type
when "mandelbrot"
  fractal = Fractals::Mandelbrot.new png
when "julia"
  fractal = Fractals::Julia.new png
  fractal.real = ca
  fractal.imaginary = cb
else
  fractal = Fractals::Mandelbrot.new png
end


fractal.colouring = args["color"] if args.key? "color" # --color=mono
fractal.colouring = args["mode"] if args.key? "mode" # --mode=mono

definition, scale = 255, 2.0
definition = args["def"].to_i if args.key? "def" # --def=100
scale = args["scale"].to_f if args.key? "scale"  # --scale=1.5
offset = [0, 0]
offset = args["offset"].split(',').map(&:to_f) if args.key? "offset"

unless o.empty?
  fractal.draw(definition, scale, offset).save(o)
  exit 0
end

fractal.draw(definition, scale, offset).save("#{fractal_type}-fractal.png")