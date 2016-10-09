class Refreshments
  
  attr_reader(:refreshments_name, :refreshments_cost, :age_limit)

  def initialize(refreshments_name, refreshments_cost, age_limit)
    @refreshments_name = refreshments_name
    @refreshments_cost = refreshments_cost
    @age_limit = age_limit
  end

end