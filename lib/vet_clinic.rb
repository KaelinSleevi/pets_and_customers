class VetClinic
  attr_reader :name,
              :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def pets_under_care
    @customers.flat_map do |customer|
      customer.pets.sort_by do |pet|
        pet.age
      end.reverse
    end
  end

  def num_pets(customer)
    customer.pets.count { |pet| pet }
  end
end
