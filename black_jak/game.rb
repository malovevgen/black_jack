class Game
  def puts_player_cards(array)
    array.map do |item|
      puts "#{item[0]} #{item[1]}"
    end
  end

  def start
    @controller = Controller.new
    puts 'Введите свое имя'
    @user = @controller.create_user
    @user.name = gets.chomp.capitalize
    first_step
  end

  def first_step
    @controller.distribution
    puts 'Ваши карты:'
    puts_player_cards(@controller.user_cards)
    puts 'Карты дилера:'
    puts_player_cards(@controller.dealer_cards)
  end
end
