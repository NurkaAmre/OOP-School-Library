require './nameable'

class Basedecorator < Nameable
  def initialize(nameable)
    @nameable = nameable
    super
  end

  def correct_name
    @nameable
  end
end
