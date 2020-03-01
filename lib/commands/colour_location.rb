# frozen_string_literal: true

# colours specific location
class ColourLocation < Command
  def run
    super

    @image.pixels.tap do |i|
      i.to_a[positions.last][positions.first] = colour
    end
  end
end
