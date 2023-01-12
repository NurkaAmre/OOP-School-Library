require './capitalize'
require './person'

describe CapitalizeDecorator do
  context 'Capitalize first letters' do
    before :each do
      @person = Person.new(24, 'dickens')
      @capitalize_decorator = CapitalizeDecorator.new(@person)
    end

    it 'Returns a new capitalized decorator object' do
      expect(@capitalize_decorator).to be_instance_of CapitalizeDecorator
    end
  end
end
