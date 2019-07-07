class Controller
  attr_accessor :dealer, :player

  def initialize
    @dealer = Dealer.new
    @money = Money.new
    @desk = Desk.new
    @interface = Interface.new
  end

  def value_cards
    @user.cards.first.map do |item|
      item.last
    end
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
    puts value_cards
    puts points_cards
    sum_cards
    puts sum_cards
    user_step
  end

  def add
    puts 'add'
    start
  end
end
