class Player
  attr_accessor :cards, :type

  def initialize
    @cards = []
  end

  def points
    raw_points = cards.sum(&:points)
    ace_in_cards = @cards.any? { |card| card.value == 'A' }
    if raw_points > 31
      raw_points - 20
    elsif raw_points > 21 && ace_in_cards
      raw_points - 10
    else
      raw_points
    end
  end

  def rating
    rating = 0
    rating = 16 if points > 21
    rating + (points - 21).abs
  end
end
