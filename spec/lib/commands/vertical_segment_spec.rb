# frozen_string_literal: true

require 'spec_helper'

describe VerticalSegment do
  let(:image) { BitmapImage.new(2, 3) }
  let(:directives) { Directive.new('V 1 1 2 W') }
  let(:subject) { VerticalSegment.new(image, directives) }

  describe '#initialize' do
    it 'creates a new instance of class' do
      expect(subject).to be_truthy
    end
  end

  describe '#run' do
    it 'colours based on location' do
      image.build
      subject.run
      expect(image.pixels).to eq [["W", "O", "O"], ["W", "O", "O"]]
    end
  end
end
