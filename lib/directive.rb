# frozen_string_literal: true

# takes command routines and partitions them
class Directive
  def initialize(line)
    @line = line
  end

  def command
    command_line.first.strip
  end

  def partitions
    @partitions ||= Hash[%i[coordinates colour].zip(
      command_line.last.strip.split(' ').partition do |val|
        val !~ /[A-Z]/
      end
    )]
  end

  private

  def command_line
    @line.split('', 2)
  end
end
