require './lib/day_care'
require './lib/customer'
require 'rspec'

RSpec.describe DayCare do
  before :each do
    @day_care1 = DayCare.new("Pup Spa")
    @day_care2 = DayCare.new("Kitty Paradise")
  end

  it 'exists' do
    expect(@day_care1).to be_instance_of(DayCare)
    expect(@day_care2).to be_instance_of(DayCare)
  end

  it 'has a name' do
    expect(@day_care1.name).to be_instance_of("Pup Spa")
    expect(@day_care2.name).to be_instance_of("Kitty Paradise")
  end
end
