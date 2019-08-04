class Interface
  AVAILABLE = {discover: 'Открыть', dealer_step: 'Пропустить', add: 'Добавить', continue: 'Продолжим', abort: 'Выход'}
  def initialize(game)
    @game = game
    @hash_menu = {}
  end

  attr_accessor :key


  def enter_user_name
    puts 'Введите свое имя'
    gets.chomp.capitalize
  end

  def greeting(name)
    puts "Привет, #{name}, сыграем?"
  end

  def puts_player_cards(array)
    array.map do |item|
      puts "#{item.value} #{item.suit}"
    end
  end

  def hide_dealer_cards(array)
    array.size.times { puts '*' }
  end

  def puts_cards(array)
    puts 'Ваши карты:'
    puts_player_cards(array)
    puts 'Карты дилера:'
  end

  def puts_hide_cards(user_array, dealer_array)
    puts_cards(user_array)
    hide_dealer_cards(dealer_array)
  end

  def puts_open_cards(user_array, dealer_array)
    puts_cards(user_array)
    puts_player_cards(dealer_array)
  end

  def create_menu
    @menu = []
    @keys = []
    @game.available
    @game.actions.each do |e|
      @menu << AVAILABLE[e]
      @keys << e
    end
  end

  def choose_command(commands)
    commands.each_with_index { |cmd, key| puts "#{key}: #{cmd}" }
    gets.chomp.to_i
  end

  def result_of_game
    puts_open_cards(@game.user.cards, @game.dealer.cards)
    puts "Ваши очки: #{@game.user.points}, очки дилера: #{@game.dealer.points}"
    puts "Ваш текущий счет:#{@game.bank.user_money}"
    puts "Текущий счет дилера: #{@game.bank.dealer_money}"
    puts "Хотите сыграть еще?"
    choice_step
  end

  def draw
    puts 'Ничья'
    result_of_game
  end

  def winner_is_user
    puts " #{@game.user.name}, Вы выиграли,"
    result_of_game
  end

  def winner_is_dealer
    puts " #{@game.user.name}, Вы проиграли,"
    result_of_game
  end

  def start
    @game.user.name = enter_user_name
    greeting(@game.user.name)
    @game.distribution
    puts_hide_cards(@game.user.cards, @game.dealer.cards)
    @game.status = :choice_step    
    choice_step
  end

  def choice_step
    create_menu
    command_index = choose_command(@menu)
    key = @keys[command_index]
    #@game.selector(key)
    @game.send(key)
    send(@game.status)
  end

  def discover
    puts "you're in interface.discover"
    #puts_open_cards(@game.user.cards, @game.dealer.cards)

    #send(@game.status)
  end

  def add
    puts "you're in interface.add"
    puts @dealer.points
    @game.add
    selector(@game.status)
  end
end
