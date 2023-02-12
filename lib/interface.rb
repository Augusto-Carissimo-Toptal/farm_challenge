require_relative 'animal'
require_relative 'farm'
require_relative 'chicken'
require_relative 'cow'
require_relative 'sheep'

def sum_production(animals)
  products = 0
  animals.map { |animal| products += animal.total_food }
  products
end

input = 0
while not input == 1 || input == 2
  p 'Welcome!'
  p 'What do you like to do?'
  p 'To create a Farm, press 1'
  p 'To quit, press 2'

  input = gets.chomp.to_i
end

if input == 1
  p 'What is your name?'
  name = gets.chomp
  farm = Farm.new(name)
  p "#{farm.name} has been created!"

  option = 0
  while not option == 4
    p 'What do you like to do next?'
    p 'Add an animal to the farm? (Press 1)'
    p 'Remove an animal from the farm? (Press 2)'
    p 'Come back and check production? (Press 3)'
    p 'Quit? (Press 4)'
    option = gets.chomp.to_i

    case option
    when 1
      animal_type = ''
      while not ['cow', 'chicken', 'sheep'].include?(animal_type)
        p 'What animal would you like to add? Choose between cow, chicken and sheep'
        animal_type = gets.chomp.downcase
      end

      p 'Choose a name for your new animal!'
      animal_name = gets.chomp

      case animal_type
      when 'cow'
        farm.add_animal(Cow.new(animal_name))
      when 'chicken'
        farm.add_animal(Chicken.new(animal_name))
      when 'sheep'
        farm.add_animal(Sheep.new(animal_name))
      end
      p "#{animal_name}, the #{animal_type} has been added to #{farm.name}!"


    when 2
      p 'Tell us the name of the animal you would like to remove'
      animal_name = gets.chomp
      list_of_all_animals = farm.cows.concat(farm.chickens, farm.sheep)
      list_of_all_animals.each do |animal|
        if animal.name.downcase == animal_name.downcase
          farm.remove_animal(animal)
          p "#{animal_name} has been remove from #{farm.name}!"
        else
          p 'Animal not found'
        end
      end

    when 3
      p 'How many days would you like to produce?'
      days = gets.chomp.to_i
      milk_produce = days / 7
      wool_produce = days / 30

      farm.chickens.map { |chicken| days.times {chicken.produce_food!} }

      if milk_produce >= 1
        farm.cows.map { |cow| milk_produce.times {cow.produce_food!} }
      end

      if wool_produce >= 1
        farm.sheep.map { |ind_sheep| wool_produce.times {ind_sheep.produce_food!} }
      end

      eggs = sum_production(farm.chickens)
      milk = sum_production(farm.cows)
      wool = sum_production(farm.sheep)

      p "Your farm has produce #{eggs} eggs, #{milk} units of milk and #{wool} units of wool"
    end
  end

elsif input == 2
  p 'Byebye'
end

