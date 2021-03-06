# frozen_string_literal: true

require 'spec_helper'

describe BitmapEditor do
  let(:invalid_extension) { fixture('invalid_extension.csv') }
  let(:invalid_path) { fixture('invalid_path.txt') }
  let(:invalid_command) { fixture('invalid_command.txt') }
  let(:valid_file) { fixture('valid_file.txt') }
  let(:empty_file) { fixture('empty_file.txt') }
  let(:invalid_routine) { fixture('invalid_routine.txt') }
  let(:invalid_coordinate) { fixture('invalid_coordinate.txt') }
  let(:i_file) { fixture('i.txt') }
  let(:c_file) { fixture('c.txt') }

  describe '#initialize' do
    it 'creates a new instance of the bitmap editor' do
      expect(described_class.new(valid_file)).to be_truthy
    end
  end

  describe '#run' do
    context 'returns validations error' do
      it 'when file extension is invalid' do
        expect do
          described_class.new(invalid_extension).run
        end.to output(/Invalid File format/).to_stdout
      end

      it 'when file path is invalid' do
        expect do
          described_class.new(invalid_path).run
        end.to output(/File does not exist/).to_stdout
      end

      it 'when non supported command directive is used' do
        expect do
          described_class.new(invalid_command).run
        end.to output("Invalid command directives (R)\n").to_stdout
      end
    end

    context 'returns valid output' do
      it 'when file and commands are valid' do
        expect do
          described_class.new(valid_file).run
        end.to output(/OOOOO\nOOZZZ\nAWOOO\nOWOOO\nOWOOO\nOWOOO\n/).to_stdout

        expect do
          described_class.new(empty_file).run
        end.to output('').to_stdout
      end
    end

    context 'commands' do
      it 'creates M x N pixels when sent \'I 4 4\' directive' do
        expect do
          described_class.new(i_file).run
        end.to output("OOOO\nOOOO\nOOOO\nOOOO\n").to_stdout
      end

      it 'clears the M x N pixels when sent \'C\' directive' do
        expect do
          described_class.new(c_file).run
        end.to output("OOOO\nOOOO\nOOOO\nOOOO\n").to_stdout
      end
    end

    context 'errors' do
      it 'raises error when the routine is invalid' do
        expect do
          described_class.new(invalid_routine).run
        end.to raise_error(InvalidRoutineError)
      end

      it 'raises error when the coordinate is invalid' do
        expect do
          described_class.new(invalid_coordinate).run
        end.to raise_error(InvalidCoordinateError)
      end
    end
  end
end
