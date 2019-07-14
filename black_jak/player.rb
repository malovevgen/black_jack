class Player
  attr_accessor :cards, :points, :type

  def initialize
    @cards = []
  end

  def value_cards
    @cards.map(&:last)
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
    if (points_cards.sum == 32) || ((points_cards.sum == 31) && points_cards.include?(9))
      sum_cards = points_cards.sum - 20
    elsif points_cards.include?(11) && (points_cards.sum > 21)
      sum_cards = points_cards.sum - 10
    else
      sum_cards = points_cards.sum
    end
  end

  def rating
    rating = 0
    rating = 16 if sum_cards > 21
    rating += (sum_cards - 21).abs
  end
end
