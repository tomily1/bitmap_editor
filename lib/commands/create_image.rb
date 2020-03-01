# frozen_string_literal: true

# creates and image
class CreateImage < Command
  def run
    @image.rows = coordinates.last
    @image.columns = coordinates.first
    @image.build
  end
end
