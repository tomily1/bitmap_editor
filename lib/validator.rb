# frozen_string_literal: true

# validates commands
class Validator
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def run
    return 'Invalid File format' if @path.split('.').last != 'txt'

    'File does not exist' unless File.exist?(@path)
  end
end
