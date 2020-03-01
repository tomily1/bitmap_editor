# frozen_string_literal: true

# creates and image
class CreateImage < Command
  def run
    super

    @image.rows = coordinates.last
    @image.columns = coordinates.first
    @image.build
  end
end
