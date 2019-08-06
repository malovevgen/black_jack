class Player
  attr_accessor :cards, :type

  def initialize
    @cards = []
  end

  def points
    raw_points = @cards.map(&:points).sum
    count_aces = @cards.count { |card| card.value == 'A' }
    count_aces.times do
      raw_points -= 10 if raw_points > 21
    end
    raw_points
  end

  def rating
    rating = 0
    rating = 16 if points > 21
    rating + (points - 21).abs
  end
end
