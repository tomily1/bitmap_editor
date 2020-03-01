# frozen_string_literal: true

# Base class for commands
class Command
  def initialize(image, partitions)
    @image = image
    @partitions = partitions
  end

  private

  def colour
    @colour ||= @partitions.fetch(:colour)[0]
  end

  def coordinates
    @coordinates ||= @partitions.fetch(:coordinates).map(&:to_i)
  end

  def positions
    @positions ||= coordinates.map { |coordinate| coordinate - 1 }
  end
end
