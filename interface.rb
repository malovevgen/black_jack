class Interface
  AVAILABLE = {discover: 'Открыть', dealer_step: 'Пропустить', add: 'Добавить'}
  def initialize(game)
    @game = game
    @hash_menu = {}
  end

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
    @array_menu = @game.actions.each { |e| @hash_menu.store(e, AVAILABLE[e]) }
    @array_menu = @hash_menu.values
  end

  def choose_command(commands)
    commands.each_with_index { |cmd, key| puts "#{key}: #{cmd}" }
    gets.chomp.to_i
  end



  def start
    @game.user.name = enter_user_name
    greeting(@game.user.name)
    distribution
    #case game.status
    #when :initialized
      #game.distribution
    #when :distributed
      #choose_action(game.actions)
      #game.send(action)
    #end
    #game.status
    #game.actions
  end

  def distribution
    @game.distribution
    #game_status
    user_step
  end

  def user_step
    puts_hide_cards(@game.user.cards, @game.dealer.cards)
    create_menu
    command = choose_command(@array_menu)
    
    puts @array_menu[command]

    #puts @array_menu
    #commands = commands_list(@game.user.cards.size)
  end

  def choose_action(actions)
    actions.each_with_index { |act, key| puts "#{key}: #{act}" }
    gets.chomp.to_i
  end

  def game_status
    puts @game.status
    puts @game.user.cards
    puts @game.actions
  end

end
