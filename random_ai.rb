class RandomAI
  def choose_position
    columns = ["A", "B", "C"]
    rows = ["1", "2", "3"]
    return "#{columns.sample}#{rows.sample}"
  end
end
