class Interface
  attr_accessor :name
  def enter_user_name
    puts 'Введите свое имя'
    @name = gets.chomp.capitalize
    puts "Привет, #{name}, сыграем?"
  end

  def puts_cards(array)
    puts 'Ваши карты'
    array.map do |items|
      items.map do |item|
        puts "#{item[0]} #{item[1]}"
      end
    end
  end
end
