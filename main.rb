require_relative 'interface'
require_relative 'game'
require_relative 'bank'
require_relative 'player' # parent class for dealer and user
require_relative 'dealer'
require_relative 'user'
require_relative 'card'
require_relative 'deck'

@user = User.new
@game = Game.new(@user)
Interface.new(@game).start
