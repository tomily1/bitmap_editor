class Directive
  def initialize(line)
    @line = line
  end

  def command
    command_line.first.strip
  end

  def coordinates
    @coordinates ||= Hash[[:coordinates, :color].zip(
      command_line.last.strip.split(" ").partition do |val|
        val !~ /[A-Z]/
      end
    )]
  end

  private

  def command_line
    @line.split('', 2)
  end
end
