class Money
  attr_accessor :user_money, :dealer_money, :bank_money, :bet

  def initialize
    @bank_money = 0
    @user_money = 100
    @dealer_money = 100
    @bet = 10
  end

  def bet_money
    if @user_money >= @bet && @dealer_money >= @bet
      @bank_money += 2 * @bet
      @user_money -= @bet
      @dealer_money -= @bet
    end
  end

  def take_money(player)
    @bank_money -= 20
    if player.type == 'user'
      @user_money += 20
    else
      @dealer_money += 20
    end
  end
end