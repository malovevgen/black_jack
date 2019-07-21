module Helper
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

  def puts_choose_command
    puts 'Выберите команду'
  end

  def choose_command(commands)
    commands.each_with_index { |cmd, key| puts "#{key}: #{cmd}" }
    gets.chomp.to_i
  end

  def commands_list(cards_count)
    commands = %w[Пропустить Открыть_карту]
    commands << 'Добавить_карту' if cards_count <= 2
    commands
  end

  def puts_result_of_game(user_points, dealer_points, user_bank, dealer_bank)
    puts "Ваши очки: #{user_points}, очки дилера: #{dealer_points}"
    puts "Ваш текущий счет: #{user_bank}, текущий счет дилера: #{dealer_bank}"
  end

  def puts_draw(user_points, dealer_points, user_bank, dealer_bank)
    puts "Ничья"
    puts_result_of_game(user_points, dealer_points, user_bank, dealer_bank)
  end

  def puts_winner_is_user(name, user_points, dealer_points, user_bank, dealer_bank)
    puts " #{name}, Вы выиграли,"
    puts_result_of_game(user_points, dealer_points, user_bank, dealer_bank)
  end

  def puts_winner_is_dealer(name, user_points, dealer_points, user_bank, dealer_bank)
    puts " #{name}, Вы проиграли,"
    puts_result_of_game(user_points, dealer_points, user_bank, dealer_bank)
  end

  def puts_request_to_continue
    puts 'Продолжим?'
  end

  def commands_list_request
    %w[Выход Продолжим]
  end

  def choose_command_request
    @commands_request.each_with_index { |cmd, key| puts "#{key}: #{cmd}" }
    gets.chomp.to_i
  end
end
