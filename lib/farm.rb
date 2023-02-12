class Farm
  attr :name, :cows, :chickens, :sheep

  def initialize(name)
    @name = "#{name}'s farm"
    @cows = []
    @chickens = []
    @sheep = []
  end

  def add_animal(instance_of_animal)
    case instance_of_animal
    when Cow
      cows << instance_of_animal
    when Chicken
      chickens << instance_of_animal
    when Sheep
      sheep << instance_of_animal
    end
  end

  def remove_animal(instance_of_animal)
    if cows.any? { |cow| cow.name == instance_of_animal.name}
      cows.delete(instance_of_animal)
    elsif chickens.any? { |chicken| chicken.name == instance_of_animal.name}
      chickens.delete(instance_of_animal)
    elsif sheep.any? { |individual_sheep| individual_sheep.name == instance_of_animal.name}
      sheep.delete(instance_of_animal)
    end
  end

  def dump_production_to_file
    path = './lib/production.txt'
    File.delete(path) if File.exist?(path)

    eggs = sum_production(chickens)
    milk = sum_production(cows)
    wool = sum_production(sheep)

    f = File.new(path, 'w').write(
      "Cows milk amount -- #{milk}, Chickens eggs count -- #{eggs}, and Sheep wool amount -- #{wool}")
  end

  private

  def sum_production(animals)
    products = 0
    animals.map { |animal| products += animal.total_food }
    products
  end
end