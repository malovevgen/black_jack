require_relative 'helper'
class Controller
  include Helper

  attr_accessor :dealer, :player

  def initialize
    @dealer = Dealer.new
    @bank = Bank.new
    @deck = Deck.new
  end

  def start
    @user = User.new
    @user.name = enter_user_name
    greeting(@user.name)

    distribution
  end

  def distribution
    @user.cards = []
    @dealer.cards = []
    2.times { @user.cards << @deck.cards.shift }
    2.times { @dealer.cards << @deck.cards.shift }
    @bank.bet_money

    user_step
  end

  def user_step
    puts_hide_cards(@user.cards, @dealer.cards)
    commands = commands_list(@user.cards.size)
    menu(commands) do |all_commands, current_command|
      case current_command
      when all_commands.index('Пропустить') then dealer_step
      when all_commands.index('Открыть_карту') then discover
      when all_commands.index('Добавить_карту') then add
      end
    end
  end

  def dealer_step
    if @dealer.points >= 17
      user_step
    else
      @dealer.cards << @deck.cards.shift
      if @user.cards.size == 3
        discover
      else
        user_step
      end
    end
  end

  def menu(commands)
    puts_choose_command
    command = choose_command(commands)
    loop do
      yield(commands, command)
    end
  end

  def discover
    puts_open_cards(@user.cards, @dealer.cards)
    if @user.rating == @dealer.rating
      draw
    elsif @user.rating < @dealer.rating
      winner_is_user
    else
      winner_is_dealer
    end
  end

  def add
    @user.cards << @deck.cards.shift
    puts_hide_cards(@user.cards, @dealer.cards)
    discover if @dealer.cards.size == 3
    dealer_step
  end

  def draw
    @bank.draw
    puts_draw(@user.points, @dealer.points, @bank.user_money, @bank.dealer_money)
    request_to_continue
  end

  def winner_is_user
    @bank.take_money(@user)
    puts_winner_is_user(@user.name, @user.points, @dealer.points, @bank.user_money, @bank.dealer_money)
    request_to_continue
  end

  def winner_is_dealer
    @bank.take_money(@dealer)
    puts_winner_is_dealer(@user.name, @user.points, @dealer.points, @bank.user_money, @bank.dealer_money)
    request_to_continue
  end

  def request_to_continue
    puts_request_to_continue
    commands = commands_list_request
    menu(commands) do |all_commands, current_command|
      case current_command
      when all_commands.index('Выход') then abort
      when all_commands.index('Продолжим') then distribution
      end
    end
  end
end
