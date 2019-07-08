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
    @user.cards << @desk.cards.shift(2)
    @dealer.cards << @desk.cards.shift(2)
    @interface.puts_players_cards(@user.cards, @dealer.cards)
    @money.bet_money
    puts @money.user_money
    user_step
  end

  def user_step
    @interface.puts_choose_command
    loop do
      commands = @interface.commands_list(@user.cards)
      command = @interface.choose_command
      case command
      when commands.index('Выход') then break
      when commands.index('Пропустить') then dealer_step
      when commands.index('Открыть_карту') then open
      when commands.index('Добавить_карту') then add
      end
    end
  end

  def dealer_step
    puts 'dealer_step'
    user_step
  end

  def open
    puts 'open'
    @user.sum_cards
    puts @user.sum_cards
    @dealer.sum_cards
    puts @dealer.sum_cards
    user_step
  end

  def add
    puts 'add'
    @user.cards << @desk.cards.shift
    puts @user.cards
    @interface.puts_players_cards(@user.cards, @dealer.cards)
    user_step
  end
end
