# frozen_string_literal: true

require 'spec_helper'

describe ClearTable do
  let(:image) { BitmapImage.new(2, 3) }
  let(:subject) { ClearTable.new(image) }

  describe '#initialize' do
    it 'creates a new instance of directive' do
      expect(subject).to be_truthy
    end
  end

  describe '#run' do
    it 'builds an empty pixel' do
      expect(subject.run).to eq [["O", "O", "O"], ["O", "O", "O"]]
    end
  end
end
