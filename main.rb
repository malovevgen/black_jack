require_relative 'helper'
require_relative 'controller'

require_relative 'bank'
require_relative 'player' # parent class for dealer and user
require_relative 'dealer'
require_relative 'user'
require_relative 'card'
require_relative 'deck'

Controller.new.start
