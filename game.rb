class Game
  attr_accessor :user, :dealer, :key, :status
  attr_reader :actions

  def initialize(user)
    @user = user
    @dealer = Dealer.new
    @bank = Bank.new
    @deck = Deck.new
    #@actions = [@distribution]
  end

  def distribution
    2.times { @user.cards << @deck.cards.shift }
    2.times { @dealer.cards << @deck.cards.shift }
    @bank.bet_money
    @status = :distributed
  end

  def available
    if @status == :user_step
      if @user.cards.size > 2
        @actions =  [:discover, :dealer_step]
      else
        @actions = [:discover, :dealer_step, :add]
      end
    else
      @actions = [:continue, :abort]
    end
  end

  def selector(key)
    send(key)
  end

  def user_step
    @status = :user_step
    puts "you're in user_step"
  end

  def dealer_step
    puts "you're in dealer_step"
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
    puts "you're in discover"
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

  #def request_to_continue
    #puts_request_to_continue
    #commands = commands_list_request
    #menu(commands) do |all_commands, current_command|
      #case current_command
      #when all_commands.index('Выход') then abort
      #when all_commands.index('Продолжим') then distribution
      #end
    #end
  #end
end
