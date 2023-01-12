require './base_decorator

describe Basedecorator do
  context 'Instance of base decorator' do
    before :each do
      @base_decorator = Basedecorator.new('Peet')
    end
    it 'return a new base decorator' do
      expect(@base_decorator).to be_instance_of Basedecorator
    end
  end
end
