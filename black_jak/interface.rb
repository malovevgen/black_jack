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
    user_array.first.map do |item|
      puts "#{item[0]} #{item[1]}"
    end
    puts 'Карты дилера:'
    dealer_array.first.size.times { puts '*' }
  end

  def puts_choose_command
    puts 'Выберите команду'
  end

  def commands_list(array)
    @commands = %w[Выход Пропустить Открыть_карту]
    @commands << 'Добавить_карту' if array.size == 1
  end

  def choose_command
    @commands.each_with_index { |cmd, key| puts "#{key}: #{cmd}" }
    command = gets.chomp.to_i
  end
end
