# class DayCare
#   attr_reader :name,
#               :customers
#
#   def initialize(name)
#     @name = name
#     @customers = []
#   end
#
#   def add_customer(customer)
#     @customers << customer
#   end
#
#   def find_by_id(id)
#     cust = []
#     @customers.each do |customer|
#       if customer.id == id
#         cust << customer.name
#       end
#     end
#     cust.first
#   end
#
#   def un_fed_pets
#     @customers.first.pets.select { |pet|  pet.fed? == false }
#   end
# end
