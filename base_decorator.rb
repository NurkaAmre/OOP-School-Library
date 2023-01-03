require '.nameable'

class Basedecorator < Nameable
  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable
end