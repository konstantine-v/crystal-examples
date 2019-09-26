require "stumpy_png"

module Fractals


  def drag(pos, pos_min, pos_max, out_min, out_max)
    return (
      (pos - pos_min) * (out_max - out_min) /
      (pos_max - pos_min) + out_min
    )
  end

  module Fractals
    class Mandelbrot
      property :colouring
      def initialize(image)
        @width, @height = image.width, image.height
        @image = image
      end
      def calculate(a, b, c_arr)
        ca, cb = c_arr
        left = a * a - b * b
        right = 2 * a * b
        a = left  + ca
        b = right + cb
        return [a, b]
      end
      def draw(definition=255, scale=2.0, offset=[0,0])
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
      def calculate(a, b, c_arr)
        left = a * a - b * b
        right = 2 * a * b
        a = left  + @real      # z^2 + c
        b = right + @imaginary
        return [a, b]
      end
    end
  end

end