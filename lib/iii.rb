require 'rspec'

require_relative 'animal'
require_relative 'farm'
require_relative 'chicken'
require_relative 'cow'
require_relative 'sheep'

cow = Cow.new('Mussy')

farm = Farm.new('Augusto Farm')

farm.add_animal(cow)

p farm.cows