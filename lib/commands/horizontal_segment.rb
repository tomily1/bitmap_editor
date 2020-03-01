# frozen_string_literal: true

# draw horizontal segment
class HorizontalSegment < Command
  def run
    super

    @image.pixels[positions.last][segment] = colour_area
  end

  def segment
    positions[0]..positions[1]
  end

  def colour_area
    Array.new((positions[1] - positions[0] + 1), colour)
  end
end
