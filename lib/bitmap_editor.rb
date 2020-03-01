require 'bitmap_image'
require 'directive'
require 'validator'

class BitmapEditor
  attr_reader :file_path, :directives, :raw_directives

  SUPPORTED_COMMANDS_REGEX = Regexp.new(/^[I|C|L|V|H|S]/)

  def initialize(file_path)
    @file_path = file_path
  end

  def run
    validation_message = Validator.new(@file_path).run

    return puts validation_message unless validation_message.nil?

    bitmap_image = BitmapImage.new
    File.readlines(@file_path).each do |line|
      directives = Directive.new(line.chomp)

      case directives.command
      when "I"
      when "C"
      when "L"
      when "V"
      when "H"
      when "S"
      else
        puts "Invalid command directives (#{directives.command})"
        # break
      end
    end
  end
end
