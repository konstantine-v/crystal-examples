require "stumpy_png"
require "admiral"

# Setup Admiral Flags and Args to define sets for Stumpy
class Fractal < Admiral::Command
  define_help description: "A command that returns your BMI by passing data in via flags. (ex. fractal julia -w=600 -h=600 --color=multi --complex=-0.8+0.156i --def=100 --scale=1.5 -o=../my_fractal)"
  define_flag h : Int32,
    default: 150,
    description: "the pixel height of the output image.
     (Defaults to 300), e.g. `-h=240",
    long: height
  define_flag w : Int32,
    default: 150,
    description: "the pixel width of the output image.
     (Defaults to 300), e.g. `-w=500`",
    long: width
  define_flag color : String,
    default: "mono",
    description: "(Defaults to mono), allows you to draw the image in colour or monochromatically, e.g. `--color=mono` or `--color=multi",
    long: color
  define_flag d : Int32,
    description: "(optional), the 'definition' of the image, the amount of calculations performed or iterations of the formula. e.g. `--d=100` for 100 iterations.",
    long: definition
  define_flag o : Int32,
    description: "(*optional*) is the location in which to save your image, the `--o=` part is not required if you just write the file location with a `.png` at the end",
    long: output
  define_flag scale : Float64,
    default: 1.5,
    description: "(optional), the zoom level of the image, a higher value corresponds to a taller imaginary number line thus a smaller fractal is seen. e.g. `--scale=2.25",
    long: scale
  define_flag complex : Float64,
    default: 1.5,
    description: "(*only needed for the Julia set*) this sets a complex coordinate for the Julia set, in the form of `a±bi` ('a' and 'b' real numbers and 'i' is the square root of -1 which can take on all values in the complex plane), e.g. '-0.8+0.4i",
    long: complex
  define_flag offset : Float64,
    default: 1.5,
    description: "(optional), the offset will make you able to position yourself where you like on the plan. (offsetting where the centre is, before (0,0) was the centre of the image, but now your offset is the centre). Make sure you give an x and y value as numerics, (ints and floats work both and don't leave any spaces between the comma)",
    long: offset
  define_argument fractset : String,
    default: "mandlebrot",
    description: "the type of fractal drawn. This argument is composed of just the fractal's name, put at any position in your list of arguments. (e.g. `mandelbrot` or `julia`)",
    long: fractset

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
      a = left + ca
      b = right + cb
      return [a, b]
    end

    private def draw(definition = 255, scale = 2.0, offset = [0, 0])
      scaleWidth = scale
      scaleHeight = scale.to_f * (@height.to_f // @width.to_f)
      definition = definition.to_f
      (0..@width - 1).each do |x|
        (0..@height - 1).each do |y|
          a = ca = drag x, 0, @width, -scaleWidth + offset[0], scaleWidth + offset[0]
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
      a = left + @real # z^2 + c
      b = right + @imaginary
      return [a, b]
    end
  end

  def run
    # Variables
    allowed_colors = ["mono", "multi"]
    allowed_fractals = ["mandelbrot", "julia"]
    # fractal_type = String.new

    # Define What to do with args and flags given handled by Admiral

  end
end

# This will be changes to use the run variable set by Admiral
# It should be something like:
#  Fractal.run(blah).blah(blah)
fractal.draw(definition, scale, offset).save("#{fractal_type}-fractal.png")
