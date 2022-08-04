require './lib/day_care'
require './lib/customer'
require 'rspec'

RSpec.describe DayCare do
  before :each do
    @day_care1 = DayCare.new("Pup Spa")
    @day_care2 = DayCare.new("Kitty Paradise")

    @joel = Customer.new("Joel", 2)

    @samson = Pet.new({name: "Samson", type: :dog})
    @lucy = Pet.new({name: "Lucy", type: :cat})

    @joel.adopt(@samson)
    @joel.adopt(@lucy)
  end

  it 'exists' do
    expect(@day_care1).to be_instance_of(DayCare)
    expect(@day_care2).to be_instance_of(DayCare)
  end

  it 'has a name' do
    expect(@day_care1.name).to eq("Pup Spa")
    expect(@day_care2.name).to eq("Kitty Paradise")
  end

  it 'has no customers by default' do
    expect(@day_care1.customers).to eq([])
    expect(@day_care2.customers).to eq([])
  end

  it 'can have customers with pets' do
    @day_care1.add_customer(@joel)
    expect(@day_care1.customers).to eq([@joel])
  end

  it 'customer can be found by id' do
    @day_care1.add_customer(@joel)
    expect(@day_care1.find_by_id(2)).to eq("Joel")
  end

  it 'can return the amount of pets that are unfed' do
    @day_care1.add_customer(@joel)
    expect(@day_care1.un_fed_pets).to eq([@samson, @lucy])
  end
end
