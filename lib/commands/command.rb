# frozen_string_literal: true

class InvalidRoutineError < StandardError; end
class InvalidCoordinateError < StandardError; end
# Base class for commands
class Command
  def initialize(image, directives)
    @image = image
    @command = directives.command
    @partitions = directives.partitions
  end

  def run
    raise InvalidRoutineError if invalid_routine?
    raise InvalidCoordinateError if invalid_coordinate?
  end

  private

  def invalid_routine?
    (coordinates.size != 2 || coordinates.size != 3) &&
      colour.nil? && !%w[I S].include?(@command)
  end

  def invalid_coordinate?
    positions.any?(&:negative?)
  end

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
