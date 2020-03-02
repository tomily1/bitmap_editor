# frozen_string_literal: true

require 'spec_helper'

describe Directive do
  let(:subject) { described_class.new('I 5 5') }

  describe '#initialize' do
    it 'creates a new instance of directive' do
      expect(subject).to be_truthy
    end
  end

  describe '#command' do
    it 'fetches the command form the line directive' do
      expect(subject.command).to eq('I')
    end
  end

  describe '#partitions' do
    it 'splits the coordinates and colour into a hash' do
      expect(subject.partitions).to eq({:colour=>[], :coordinates=>["5", "5"]})
    end
  end
end
