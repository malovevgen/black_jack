class Controller
  attr_accessor :dealer, :player

  def initialize
    @dealer = Dealer.new
    @money = Money.new
    @desk = Desk.new
    @interface = Interface.new
  end

  def start
    @user = User.new
    @user.name = @interface.enter_user_name
    @interface.greeting
    @desk.cards.shuffle
    distribution
  end

  def distribution
    @user.cards = []
    @dealer.cards = []
    2.times { @user.cards << @desk.cards.shift }
    2.times { @dealer.cards << @desk.cards.shift }
    #@interface.puts_players_cards(@user.cards, @dealer.cards)
    @money.bet_money
    puts @money.user_money
    user_step
  end

  def user_step
    @interface.puts_players_cards(@user.cards, @dealer.cards)
    @interface.puts_choose_command
    loop do
      commands = @interface.commands_list(@user.cards)
      command = @interface.choose_command
      case command
      when commands.index('Пропустить') then dealer_step
      when commands.index('Открыть_карту') then open
      when commands.index('Добавить_карту') then add
      end
    end
  end

  def dealer_step
    puts 'dealer_step'
    if @dealer.sum_cards >= 17
      user_step
    else
      @dealer.cards << @desk.cards.shift
    end
    user_step
  end

  def open
    @user.sum_cards
    #puts @user.sum_cards
    puts @user.rating
    @dealer.sum_cards
    puts @dealer.sum_cards
    puts @dealer.rating
    if @user.rating == @dealer.rating
      draw
    elsif @user.rating < @dealer.rating
      winner_is_user
    else
      winner_is_dealer
    end
  end

  def add
    puts 'add'
    @user.cards << @desk.cards.shift
    puts @user.cards
    @interface.puts_players_cards(@user.cards, @dealer.cards)
    user_step
  end

  def draw
    @interface.puts_draw
    request_to_continue
  end

  def winner_is_user
    @interface.puts_winner_is_user
    request_to_continue
  end

  def winner_is_dealer
    @interface.puts_winner_is_dealer
    request_to_continue
  end

  def request_to_continue
    @interface.puts_request_to_continue
    loop do
      commands = @interface.commands_list_request
      command = @interface.choose_command_request
      case command
      when commands.index('Выход') then break
      when commands.index('Продолжим') then distribution
      end
    end
  end
end
