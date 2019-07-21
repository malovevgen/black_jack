class Card
  attr_accessor :value, :suit

  def initialize(value, suit)
    self.value = value
    self.suit = suit
  end

  def points
    if value =~ /\d+/
      value.to_i
    elsif value == 'A'
      11
    else
      10
    end
  end
end
