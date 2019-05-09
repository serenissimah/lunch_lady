class Customer
  attr_accessor :dishes
  
  def initialize
    @dishes = []
  end
 
  def get_total
    @dishes.sum { |d| d.price }
  end

end

class Dish
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
 
end
 
 
 
class LunchLady
  MAIN_DISHES = [
    { name: "chicken", price: 2.00 },
    { name: "beef", price: 3.00 },
    { name: "fish", price: 5.00 }
  ]
 
  SIDE_DISHES = [
    { name: "rice", price: 1.00 },
    { name: "fries", price: 1.00 },
    { name: "salad", price: 1.00 },
    { name: "chips", price: 1.00 },
  ]
 
  def initialize
    @customers = []
  end
 
  def take_order
    customer = Customer.new
    @customers << customer
    give_main_dish(customer)
    give_side_dish(customer)
    give_side_dish(customer)
  end
 

  def give_main_dish(fellow)
    begin
    puts "What is your choice for a main dish?"
    MAIN_DISHES.each_with_index do |dish, i|
    puts "#{i + 1}. #{dish[:name]} #{dish[:price]}"
    end

  input = gets.strip.to_i
    raise unless input > 0 && input <= MAIN_DISHES.length
    fellow.dishes << Dish.new(
    MAIN_DISHES[input - 1][:name],
    MAIN_DISHES[input - 1][:price]
  )
    rescue
    retry
  end
end
 

  def give_side_dish(fellow)
    begin
    puts "What is your choice for a side dish?"
    SIDE_DISHES.each_with_index do |dish, i|
    puts "#{i + 1}. #{dish[:name]} #{dish[:price]}"
  end
 
    input = gets.strip.to_i
    raise unless input > 0 && input <= SIDE_DISHES.length
    fellow.dishes << Dish.new(
      SIDE_DISHES[input - 1][:name],
      SIDE_DISHES[input - 1][:price]
    )
    rescue
    retry
  end
end
 
 
  def repeat_customer_order(customer_index)
    customer = @customers[customer_index]
    puts "Your order is:"
    customer.dishes.each do |dish|
    puts "#{dish.name} #{dish.price}"
    end
    puts "Your total is: $#{customer.get_total}"
  end
end
 

 lunch_lady = LunchLady.new
 lunch_lady.take_order
 lunch_lady.take_order
 lunch_lady.take_order
 lunch_lady.repeat_customer_order(0)
 lunch_lady.repeat_customer_order(1)
 lunch_lady.repeat_customer_order(2)