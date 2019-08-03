class Interface
  AVAILABLE = {discover: 'Открыть', dealer_step: 'Пропустить', add: 'Добавить'}
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
    @hash_menu = {}
    @game.available
    @game.actions.each { |e| @hash_menu.store(AVAILABLE[e], e) }
    @array_menu = @hash_menu.keys
  end

  def choose_command(commands)
    commands.each_with_index { |cmd, key| puts "#{key}: #{cmd}" }
    gets.chomp.to_i
  end

  def start
    @game.user.name = enter_user_name
    greeting(@game.user.name)
    distribution
  end

  def distribution
    @game.distribution
    user_step
  end

  def user_step
    puts_hide_cards(@game.user.cards, @game.dealer.cards)
    create_menu
    command_index = choose_command(@array_menu)
    key = @hash_menu[@array_menu[command_index]]
    @game.selector(key)
    selector(@game.status)
  end

  def selector(key)
    if key == :discover
      discover
    elsif key == :add
      add
    elsif key == :user_step
      user_step
    end
  end

  def discover
    puts "you're in interface.discover"
    @game.discover
  end

  def add
    puts "you're in interface.add"
    puts @dealer.points
    @game.add
    selector(@game.status)
  end
end
