class Player
  def initialize
    @type = "HUMAN"
    @symbol = "X"
  end

  def set_symbol(params)
    @symbol = params.upcase
  end

  def return
    return {:type => @type, :symbol => @symbol}
  end
end
