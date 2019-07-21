class Bank
  attr_accessor :user_money, :dealer_money, :bank_money, :bet

  def initialize
    @bank_money = 0
    @user_money = 100
    @dealer_money = 100
    @bet = 10
  end

  def bet_money
    raise 'Not enough money' if @user_money < @bet || @dealer_money < @bet

    @user_money -= @bet
    @dealer_money -= @bet
    @bank_money += 2 * @bet
  end

  def take_money(player)
    if player.type == 'user'
      @user_money += @bank_money
    else
      @dealer_money += @bank_money
    end
    @bank_money = 0
  end

  def draw
    @user_money += @bet
    @dealer_money += @bet
    @bank_money = 0
  end
end
