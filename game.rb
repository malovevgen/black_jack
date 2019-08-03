class Game
  attr_accessor :user, :dealer, :key, :status
  attr_reader :actions

  def initialize(user)
    @user = user
    @dealer = Dealer.new
    @bank = Bank.new
    @deck = Deck.new
    @actions = [@distribution]
  end

  def distribution
    2.times { @user.cards << @deck.cards.shift }
    2.times { @dealer.cards << @deck.cards.shift }
    @bank.bet_money
    @status = :distributed
    available
  end

  def available
    if @status == :distributed
      if @user.cards.size > 2
        @actions =  [:discover, :dealer_step]
      else
        @actions = [:discover, :dealer_step, :add]
      end
    else @status == :puts_evrithing
    end
  end

  def selector(key)
    if key == :discover
      discover
    elsif key == :dealer_step
      dealer_step
    elsif key == :add
      add
    end
  end

  def discover
    puts "you're in discover"
  end

  def user_step
    @status = :user_step
    puts "you're in user_step"
  end

  def dealer_step
    if @dealer.points >= 17
      user_step
    else
      @dealer.cards << @deck.cards.shift
      if @user.cards.size == 3
        discover
      else
        user_step
      end
    end
  end

  def add
    puts "you're in add"
  end
end
