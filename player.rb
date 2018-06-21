class Player
  def initialize(order=1, type="HUMAN", symbol="X") #default to first player human X
    @type = type.upcase
    @order = order
    self.set_symbol(symbol)
  end

  def set_symbol(params)
    @symbol = params.upcase
  end

  def return
    return {:order => @order, :type => @type, :symbol => @symbol}
  end
end
