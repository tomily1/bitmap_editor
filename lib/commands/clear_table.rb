# frozen_string_literal: true

class ClearTable
  def initialize(image)
    @image = image
  end

  def run
    @image.build
  end
end
