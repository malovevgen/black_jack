class Controller
  attr_accessor :dealer, :player

  def initialize
    @dealer = Dealer.new
    @money = Money.new
    @desk = Desk.new
  end

  def enter_user_name
    puts 'Введите свое имя'
    name = gets.chomp.capitalize
    @user = User.new(name)
    puts "Привет, #{name}, сыграем? Ставим по #{@money.bet}"
  end

  def puts_user_cards
    @user.cards << @desk.cards.shift(2)
    puts 'Ваши карты:'
    @user.cards.map do |card|
      card.map do |item|
        print "#{item[0]} #{item[1]}"
      end
    end
    puts 'Господа, ставки сделаны!'
  end

  def start
    enter_user_name
    distribution
  end

  def distribution
    puts_user_cards
  end
end
