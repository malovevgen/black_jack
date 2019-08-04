class Game
  attr_accessor :user, :dealer, :key, :status
  attr_reader :actions, :bank

  def initialize(user)
    @user = user
    @dealer = Dealer.new
    @bank = Bank.new
    @deck = Deck.new
  end

  def distribution
    2.times { @user.cards << @deck.cards.shift }
    2.times { @dealer.cards << @deck.cards.shift }
    @bank.bet_money
  end

  def available
    if @status == :choice_step
      if @user.cards.size > 2
        @actions =  %i[discover dealer_step]
      else
        @actions = %i[discover dealer_step add]
      end
    else
      @actions = %i[continue abort]
    end
  end

  def choice_step
    @status = :choice_step
  end

  def dealer_step
    if @dealer.points >= 17
      choice_step
    else
      @dealer.cards << @deck.cards.shift
      if @user.cards.size == 3
        discover
      else
        choice_step
      end
    end
  end

  def add
    @status = :add
    puts "you're in add"
    @user.cards << @deck.cards.shift
    if @dealer.cards.size == 3
      discover
    else
      dealer_step
    end
  end

  def discover
    if @user.rating == @dealer.rating
      @status = :draw
      @bank.draw
    elsif @user.rating < @dealer.rating
      @status = :winner_is_user
      @bank.take_money(@user)
    else
      @status = :winner_is_dealer
      @bank.take_money(@dealer)
    end
  end

  def continue
    puts "you're in continue"
    @user.cards.clear
    @dealer.cards.clear
    @status = :distribution_step
  end
end
