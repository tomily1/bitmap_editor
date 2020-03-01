class HorizontalSegment < Command
  def run
    @image.pixels[positions.last][positions[0]..positions[1]] = Array.new((positions[1] - positions[0] + 1), colour)

  end
end
