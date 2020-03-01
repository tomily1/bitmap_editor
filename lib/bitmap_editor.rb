# frozen_string_literal: true

require 'pry'
require 'commands/command'
require 'commands/clear_table'
require 'commands/colour_location'
require 'commands/create_image'
require 'commands/horizontal_segment'
require 'commands/vertical_segment'
require 'bitmap_image'
require 'directive'
require 'validator'

class BitmapEditor
  attr_reader :file_path, :directives, :raw_directives

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
      when 'I'
        CreateImage.new(bitmap_image, directives).run
      when 'C'
        ClearTable.new(bitmap_image).run
      when 'L'
        ColourLocation.new(bitmap_image, directives).run
      when 'V'
        VerticalSegment.new(bitmap_image, directives).run
      when 'H'
        HorizontalSegment.new(bitmap_image, directives).run
      when 'S'
        puts bitmap_image.show
      else
        puts "Invalid command directives (#{directives.command})"
      end
    end
  end
end
