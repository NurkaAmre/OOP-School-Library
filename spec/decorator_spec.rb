require 'rspec'
require './decorator'
require './capitalize'

describe CapitalizeDecorator do
  let(:nameable) { double('Nameable', correct_name: 'john smith') }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  describe '#correct_name' do
    it 'should return the correct_name capitalized' do
      expect(decorator.correct_name).to eq('John smith')
    end
  end
end