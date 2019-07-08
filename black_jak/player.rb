class Player
  attr_accessor :cards, :points, :type

  def initialize
    @cards = []
  end

  def value_cards
    @cards.first.map(&:last)
  end

  def points_cards
    value_cards.map do |item|
      if item !~ /\w/
        item.to_i
      elsif item !~ /A/
        item = 10
      else
        item = 11
      end
    end
  end

  def sum_cards
    if points_cards.include?(11) & (points_cards.sum > 21)
      points_cards.sum -= 10
    else
      points_cards.sum
    end
  end
end
