require './base_decorator'

class CapitalizeDecorator < Basedecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
