# frozen_string_literal: true

require 'spec_helper'

describe CreateImage do
  let(:image) { BitmapImage.new }
  let(:directives) { Directive.new('I 2 3') }
  let(:subject) { CreateImage.new(image, directives) }

  describe '#initialize' do
    it 'creates a new instance of class' do
      expect(subject).to be_truthy
    end
  end

  describe '#run' do
    it 'colours based on location' do
      expect(subject.run).to eq [["O", "O"], ["O", "O"], ["O", "O"]]
    end
  end
end
