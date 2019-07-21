class Dealer  < Player
  def initialize
    super
  end

  def type
    @type = 'dealer'
  end

  def add_card?
    cards
  end
end
