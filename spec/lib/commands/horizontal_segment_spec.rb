# frozen_string_literal: true

require 'spec_helper'

describe HorizontalSegment do
  let(:image) { BitmapImage.new(2, 3) }
  let(:directives) { Directive.new('H 1 2 2 Z') }
  let(:subject) { HorizontalSegment.new(image, directives) }

  describe '#initialize' do
    it 'creates a new instance of class' do
      expect(subject).to be_truthy
    end
  end

  describe '#run' do
    it 'colours based on location' do
      image.build
      subject.run
      expect(image.pixels).to eq [["O", "O", "O"], ["Z", "Z", "O"]]
    end
  end
end
