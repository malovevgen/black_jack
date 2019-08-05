class Player
  attr_accessor :cards, :type

  def initialize
    @cards = []
  end

  def points
    raw_points = cards.sum(&:points)
    count_aces = @cards.select { |card| card.value == 'A' }.count
    if raw_points > 31 && count_aces > 1
      raw_points - 20
    elsif raw_points > 21 && count_aces > 0
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
