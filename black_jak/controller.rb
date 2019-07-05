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
    @interface.puts_user_cards(@user.cards)
    @interface.puts_dealer_cards(@dealer.cards)
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
      when commands.index('Пропустить') then miss
      when commands.index('Открыть_карту') then open
      when commands.index('Добавить_карту') then add
      end
    end
  end

  def miss
    puts 'miss'
  end

  def open
    puts 'open'
  end

  def add
    puts 'add'
  end
end
