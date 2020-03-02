# frozen_string_literal: true

require 'spec_helper'

describe ColourLocation do
  let(:image) { BitmapImage.new(2, 3) }
  let(:directives) { Directive.new('L 1 1 A') }
  let(:subject) { ColourLocation.new(image, directives) }

  describe '#initialize' do
    it 'creates a new instance of class' do
      expect(subject).to be_truthy
    end
  end

  describe '#run' do
    it 'colours based on location' do
      image.build
      expect(subject.run).to eq [["A", "O", "O"], ["O", "O", "O"]]
    end
  end
end
