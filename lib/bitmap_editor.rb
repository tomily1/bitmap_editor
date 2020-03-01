require 'pry'
require 'command'
require 'bitmap_image'
require 'clear_table'
require 'colour_location'
require 'create_image'
require 'directive'
require 'horizontal_segment'
require 'validator'
require 'vertical_segment'

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
        CreateImage.new(bitmap_image, directives.partitions).run
      when "C"
        ClearTable.new(bitmap_image).run
      when "L"
        ColourLocation.new(bitmap_image, directives.partitions).run
      when "V"
        VerticalSegment.new(bitmap_image, directives.partitions).run
      when "H"
        HorizontalSegment.new(bitmap_image, directives.partitions).run
      when "S"
        puts bitmap_image.show
      else
        puts "Invalid command directives (#{directives.command})"
      end
    end
  end
end
