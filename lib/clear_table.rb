class ClearTable
  def initialize(image)
    @image = image
  end

  def run
    rows = @image.rows
    columns = @image.columns
    @image = Matrix.build(rows, columns){ "O" }
  end
end
