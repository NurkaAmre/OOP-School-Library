require './base_decorator'

class Trimmer < Basedecorator
  def correct_name
    return super.slice(0..9) unless super.length <= 10
  end
end
