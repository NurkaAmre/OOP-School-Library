class Nameable
  def correct_name
    raise NotImplementedError, "NURKA #{self.class} has not implemented method '#{__method__}'"
  end
end
