class Interface
  def initialize(game)
    @game = game
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

  private

  def enter_user_name
    puts 'Введите свое имя'
    gets.chomp.capitalize
  end

  def greeting(name)
    puts "Привет, #{name}, сыграем?"
  end

  def distribution
    @game.distribution
  end

  def choose_action(actions)
    actions.each_with_index { |act, key| puts "#{key}: #{act}" }
    gets.chomp.to_i
  end

end
