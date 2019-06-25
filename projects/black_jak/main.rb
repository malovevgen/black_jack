require_relative 'controller'
require_relative 'bank'
require_relative 'cards'
require_relative 'dealer'
require_relative 'user'

game = Controller.new
game.start_game
