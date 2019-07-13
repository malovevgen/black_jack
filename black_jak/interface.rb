class Interface
  attr_accessor :name
  def enter_user_name
    puts 'Введите свое имя'
    @name = gets.chomp.capitalize
  end

  def greeting
    puts "Привет, #{@name}, сыграем?"
  end

  def puts_players_cards(user_array, dealer_array)
    puts 'Ваши карты:'
    user_array.map do |item|
      puts "#{item[0]} #{item[1]}"
    end
    puts 'Карты дилера:'
    dealer_array.size.times { puts '*' }
  end

  def puts_choose_command
    puts 'Выберите команду'
  end

  def commands_list(array)
    if array.size == 2
      @commands = %w[Пропустить Открыть_карту Добавить_карту]
    else
      @commands = %w[Пропустить Открыть_карту]
    end
  end

  def choose_command
    @commands.each_with_index { |cmd, key| puts "#{key}: #{cmd}" }
    command = gets.chomp.to_i
  end

  def puts_draw
    puts 'Ничья'
  end

  def puts_winner_is_user
    puts " #{@name}, Вы выиграли"
  end

  def puts_winner_is_dealer
    puts " #{@name}, Вы проиграли"
  end

  def puts_request_to_continue
    puts 'Продолжим?'
  end

  def commands_list_request
    @commands_request = %w[Выход Продолжим]
  end

  def choose_command_request
    @commands_request.each_with_index { |cmd, key| puts "#{key}: #{cmd}" }
    command_request = gets.chomp.to_i
  end
end
