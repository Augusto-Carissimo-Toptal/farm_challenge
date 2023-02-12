class Animal
  attr :name

  def initialize(name)
    @name = name
    @product = 0
  end

  def produce_food!
    @product += 1
  end

  def total_food
    @product
  end
end