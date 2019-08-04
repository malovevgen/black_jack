class Game
  attr_accessor :user, :dealer, :key, :status 
  attr_reader :actions, :bank

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
    if @status == :choice_step
      if @user.cards.size > 2
        @actions =  [:discover, :dealer_step]
      else
        @actions = [:discover, :dealer_step, :add]
      end
    else
      @actions = [:continue, :abort]
    end
  end

  #def selector(key)
    #send(key)
    #case key
    #when :discover then discover
    #when :dealer_step then dealer_step
    #when :add then add
    #when :continue then continue
    #when :abort then abort
    #end   
  #end

  def choice_step
    @status = :choice_step
    puts "you're in user_step"
  end

  def dealer_step
    puts "you're in dealer_step"
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
    #@status = :discover
    #@score = [@bank.user_money, @bank.dealer_money]
    #puts @score
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
