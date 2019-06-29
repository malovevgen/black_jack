class Interface
  attr_accessor :name
  def enter_user_name
    puts 'Введите свое имя'
    @name = gets.chomp.capitalize
    puts "Привет, #{name}, сыграем?"
  end

  def puts_cards
    puts 'Ваши карты:'
    controller.user.cards.map do |card|
      card.map do |item|
        print "#{item[0]} #{item[1]}"
      end
    end
  end
end
