require 'rspec'

require 'animal'
require 'farm'
require 'chicken'
require 'cow'
require 'sheep'

describe '#initialize the different classes' do
  it 'should be possible to initialize a farm' do
    expect(Farm.new('Best farm ever')).to be_instance_of Farm
  end
  it 'should be possible to initialize a cow' do
    expect(Cow.new('Claudette')).to be_instance_of Cow
  end
  it 'should be possible to initialize a chicken' do
    expect(Chicken.new('Dodo')).to be_instance_of Chicken
  end
  it 'should be possible to initialize a sheep' do
    expect(Sheep.new('Dolly')).to be_instance_of Sheep
  end
end

describe '#attr_readers' do
  it 'Cow should not have attr_reader on name' do
    expect(Cow.instance_methods(false)).not_to include(:name)
  end

  it 'Chicken should not have attr_reader on name' do
    expect(Chicken.instance_methods(false)).not_to include(:name)
  end

  it 'Sheep should not have attr_reader on name' do
    expect(Sheep.instance_methods(false)).not_to include(:name)
  end

  it 'Animal should have attr_reader on name' do
    expect(Animal.instance_methods(false)).to include(:name)
  end
end

describe '#attr_writer' do
  it 'should not be possible to change the name of a cow' do
    expect(Cow.instance_methods(false)).not_to include(:name=)
  end

  it 'should not be possible to change the name of a chicken' do
    expect(Chicken.instance_methods(false)).not_to include(:name=)
  end

  it 'should not be possible to change the name of a sheep' do
    expect(Sheep.instance_methods(false)).not_to include(:name=)
  end

  it 'should not be possible to change the name of an animal' do
    expect(Animal.instance_methods(false)).not_to include(:name=)
  end
end

describe '#total_food and #produce_food!' do
  let(:cow) { Cow.new('Claudette') }
  let(:sheep) { Sheep.new('Dolly') }
  let(:chicken) { Chicken.new('Dodo') }
  let(:number_production) { rand(0..70) }

  it 'should be possible to see the amount of food produced by a cow' do
    expect(cow.total_food).to eq(0)
  end

  it 'should be possible to see the amount of food produced by a sheep' do
    expect(sheep.total_food).to eq(0)
  end

  it 'should be possible to see the amount of food produced by a chicken' do
    expect(chicken.total_food).to eq(0)
  end

  it 'should be possible to produce more food for a cow' do
    number_production.times { cow.produce_food! }
    expect(cow.total_food).to eq(number_production)
  end

  it 'should be possible to produce more food for a chicken' do
    number_production.times { chicken.produce_food! }
    expect(chicken.total_food).to eq(number_production)
  end

  it 'should be possible to produce more food for a sheep' do
    number_production.times { sheep.produce_food! }
    expect(sheep.total_food).to eq(number_production)
  end
end

describe '#add_animal && #remove_animal' do
  let(:cow) { Cow.new('Claudette') }
  let(:cow_2) { Cow.new('Georgetta') }
  let(:sheep) { Sheep.new('Dolly') }
  let(:sheep_2) { Sheep.new('Delly') }
  let(:chicken) { Chicken.new('Dodo') }
  let(:chicken_2) { Chicken.new('Rere') }
  let(:farm) { Farm.new('Best farm ever') }

  it 'should add a cow to the correct array of the farm' do
    expect {
      farm.add_animal(cow)
      farm.add_animal(cow_2)
    }.to change { farm.cows.count }.from(0).to(2)
  end

  it 'should remove a cow from the correct array of the farm' do
    farm.add_animal(cow)
    expect { farm.remove_animal(cow) }.to change { farm.cows.count }.from(1).to(0)
    expect(farm.cows.find { |e| e.name == cow.name }).to be_nil
  end

  it 'should add a chicken to the correct array of the farm' do
    expect {
      farm.add_animal(chicken)
      farm.add_animal(chicken_2)
    }.to change { farm.chickens.count }.from(0).to(2)
  end

  it 'should remove a chicken from the correct array of the farm' do
    farm.add_animal(chicken)
    expect { farm.remove_animal(chicken) }.to change { farm.chickens.count }.from(1).to(0)
    expect(farm.chickens.find { |e| e.name == chicken.name }).to be_nil
  end

  it 'should add a sheep to the correct array of the farm' do
    expect {
      farm.add_animal(sheep)
      farm.add_animal(sheep_2)
    }.to change { farm.sheep.count }.from(0).to(2)
  end

  it 'should remove a sheep from the correct array of the farm' do
    farm.add_animal(sheep)
    expect { farm.remove_animal(sheep) }.to change { farm.sheep.count }.from(1).to(0)
    expect(farm.sheep.find { |e| e.name == sheep.name }).to be_nil
  end
end

describe '#dump_production_to_file' do
  let(:cow) { Cow.new('Claudette') }
  let(:sheep) { Sheep.new('Carrot') }
  let(:chicken) { Chicken.new('Dodo') }
  let(:farm) { Farm.new('Best farm ever') }
  let(:filepath) { './lib/production.txt' }

  before do
    create_production
    File.delete(filepath) if File.exists?(filepath)
  end

  it 'should create a txt file in the lib folder' do
    farm.dump_production_to_file
    expect(File.exists?(filepath)).to be true
  end

  it 'should have the correct information' do
    farm.dump_production_to_file
    file = File.read(filepath)
    expect(file).to include("Cows milk amount -- #{cow.total_food}", "Chickens eggs count -- #{chicken.total_food}", "Sheep wool amount -- #{sheep.total_food}")
  end

  def create_production
    [cow, chicken, sheep].each do |animal|
      farm.add_animal(animal)
      number = rand(1..100)
      number.times { animal.produce_food! }
    end
  end
end
