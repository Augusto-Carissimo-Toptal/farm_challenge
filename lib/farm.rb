require_relative "cow"
require_relative "sheep"
require_relative "chicken"

class Farm
  attr :name, :cows, :chickens, :sheep

  FARM_ANINMALS = [Cow, Sheep, Chicken].freeze

  def initialize(name)
    @name = "#{name}'s farm"
    @cows = []
    @chickens = []
    @sheep = []
  end

  def add_animal(instance_of_animal)
    class_name = instance_of_animal.class.to_s
    animal_hash[class_name] << instance_of_animal
  end

  def remove_animal(instance_of_animal)
    class_name = instance_of_animal.class.to_s
    animal_hash[class_name].delete(instance_of_animal)
  end

  def dump_production_to_file
    path = './lib/production.txt'

    File.open(path, "w+") do |file|
      file.puts generate_report_data
    end
  end

  private

  def generate_report_data
    FARM_ANINMALS.map do |animal_class|
      animal_array = animal_hash[animal_class.to_s]
      production = sum_production(animal_array)
      "#{animal_class.label} -- #{production}"
    end.join("\n")
  end

  def sum_production(animals)
    animals.sum(&:total_food)
  end

  def animal_hash
    { 'Cow' => cows, 'Chicken' => chickens, 'Sheep' => sheep }
  end
end