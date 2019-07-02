class Interface
  attr_accessor :name
  def enter_user_name
    puts 'Введите свое имя'
    @name = gets.chomp.capitalize
  end

  def greeting
    puts "Привет, #{@name}, сыграем?"
  end

  def puts_user_cards(array)
    puts 'Ваши карты:'
    array.map do |items|
      items.map do |item|
        puts "#{item[0]} #{item[1]}"
      end
    end
  end

  def puts_dealer_cards(array)
    puts 'Карты дилера:'
    array.first.size.times{ puts '*' }
  end

  def select_command(array)
    puts 'Выберите команду'
    commands = %w[Пропустить Открыть_карту]
    commands << 'Добавить_карту' if array.size == 1
    commands.each_with_index { |cmd, key| puts "#{key}: #{cmd}" }
    command = gets.chomp.to_i
  end
end
