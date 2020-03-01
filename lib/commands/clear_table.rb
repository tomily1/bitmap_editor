# frozen_string_literal: true

#clears segments on table
class ClearTable
  def initialize(image)
    @image = image
  end

  def run
    @image.build
  end
end
