# frozen_string_literal: true

class VerticalSegment < Command
  def run
    @image.pixels[positions[1]..positions[2]].map do |pixel|
      pixel[positions[0]] = colour
    end
  end
end
