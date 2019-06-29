class Controller
  attr_accessor :dealer, :player

  def initialize
    @dealer = Dealer.new
    @money = Money.new
    @desk = Desk.new
    @interface = Interface.new
    @user = User.new
  end

  def enter_user_name
    puts 'Введите свое имя'
    name = gets.chomp.capitalize
    @user.name = name
    puts "Привет, #{name}, сыграем? Ставим по #{@money.bet}"
  end

  def user_cards
    @user.cards << @desk.cards.shift(2)
    puts 'Ваши карты:'
    @user.cards.map do |card|
      card.map do |item|
        puts "#{item[0]} #{item[1]}"
      end
    end
  end

  def dealer_cards
    @dealer.cards << @desk.cards.shift(2)
    puts 'Карты дилера:'
    @dealer.cards.map do |card|
      card.map do |item|
        puts '*'
      end
    end
  end

  def start
    enter_user_name
    distribution
  end

  def distribution
    user_cards
    dealer_cards
  end
end
