# frozen_string_literal: true

require 'spec_helper'

describe BitmapImage do
  let(:image) { described_class.new(2, 3) }
  let(:pixels) { Array.new(image.rows) { Array.new(image.columns, 'O') } }
  describe '#initialize' do
    it 'creates a new instance of the bitmap editor with row and column default to 0' do
      expect(subject).to be_truthy
      expect(subject.rows).to eq 0
      expect(subject.columns).to eq 0
    end

    it 'sets the row and column of pixels' do
      expect(image.rows).to eq 2
      expect(image.columns).to eq 3
      expect(image.pixels).to eq nil
    end
  end

  describe '#build' do
    it 'creates M x N pixels' do
      expect(image.build).to eq(pixels)
    end
  end

  describe '#show' do
    it 'shows the pixel image' do
      image.build
      expect(image.show).to eq("OOO\nOOO")
    end

    it 'returns empty string if no row or column value' do
      expect(image.show).to eq('')
    end
  end
end
