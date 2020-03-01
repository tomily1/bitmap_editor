# frozen_string_literal: true

class BitmapImage
  attr_accessor :rows, :columns, :pixels

  def initialize(rows = 0, columns = 0)
    @rows = rows
    @columns = columns
  end

  def build
    @pixels = Array.new(rows) { Array.new(columns, 'O') }
  end

  def show
    return '' if @pixels.nil?

    @pixels.map do |pixel|
      pixel.join('')
    end.join("\n")
  end
end
