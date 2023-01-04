require './base_decorator'

class TrimmerDecorator < Basedecorator
  def correct_name
    return super.slice(0..9) unless super.length <= 10

    super()
  end
end
