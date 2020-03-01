class ColourLocation < Command
  def run
    @image.pixels.tap do |i|
      i.to_a[positions.last][positions.first] = colour
    end
  end
end
