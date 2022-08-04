require './lib/vet_clinic'
require './lib/customer'
require 'rspec'

RSpec.describe VetClinic do
  before :each do
    @vet_clinic1 = VetClinic.new("Pup Boo Boos")
    @vet_clinic2 = VetClinic.new("Kitty Emergency")

    @joel = Customer.new("Joel", 2)
    @sara = Customer.new("Sara", 4)

    @samson = Pet.new({name: "Samson", type: :dog, age: 4})
    @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
    @felix = Pet.new({name: "Felix", type: :cat, age: 8})
    @scout = Pet.new({name: "Scout", type: :dog, age: 3})

    @joel.adopt(@samson)
    @joel.adopt(@lucy)
    @sara.adopt(@felix)
    @sara.adopt(@scout)
  end

  it 'exists' do
    expect(@vet_clinic1).to be_an_instance_of(VetClinic)
    expect(@vet_clinic2).to be_an_instance_of(VetClinic)
  end

  it 'has a name' do
    expect(@vet_clinic1.name).to eq("Pup Boo Boos")
    expect(@vet_clinic2.name).to eq("Kitty Emergency")
  end

  it 'has no customers by default' do
    expect(@vet_clinic1.customers).to eq([])
    expect(@vet_clinic2.customers).to eq([])
  end

  it 'can have customers and pets' do
    @vet_clinic1.add_customer(@joel)
    @vet_clinic2.add_customer(@sara)
    expect(@vet_clinic1.customers).to eq([@joel])
    expect(@vet_clinic2.customers).to eq([@sara])
  end

  it 'can list all the pets under care' do
    @vet_clinic1.add_customer(@joel)
    @vet_clinic2.add_customer(@sara)
    expect(@vet_clinic1.pets_under_care).to eq([@lucy, @samson])
    expect(@vet_clinic2.pets_under_care).to eq([@felix, @scout])
  end

  it 'can count the number of pets per customer' do
    @vet_clinic1.add_customer(@joel)
    @vet_clinic2.add_customer(@sara)
    expect(@vet_clinic1.num_pets(@joel)).to eq(2)
    expect(@vet_clinic2.num_pets(@sara)).to eq(2)
  end
end
