class Player
  def initialize(order=1, symbol="X", type="HUMAN") #default to first player human X
    self.set_type(type)
    @order = order
    self.set_symbol(symbol)
  end

  def set_symbol(params)
    @symbol = params.upcase
  end

  def set_type(type)
    @type = type.upcase
  end

  def return
    return {:order => @order, :type => @type, :symbol => @symbol}
  end
end
