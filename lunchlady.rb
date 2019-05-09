require "pry"

class MainDish
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

class SideDish
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

class LunchLady 
	def initialize
    @main_dish = [
      MainDish.new("Meat", 25),
      MainDish.new("Chicken", 20),
      MainDish.new("Veggie Bowl", 25)
    ]

    @side_dish = [
      SideDish.new("Salad", 5),
      SideDish.new("Rice", 10),
      SideDish.new("Fries", 10)
    ]
    @cartprice = []
    @carttotal = []
    main_menu
  end

  def main_menu
    puts "Hello! What's for lunch today? Pick the number of what you want!"
    @main_dish.each_with_index do |item, index|
      puts "#{index+1}) #{item.name} - $#{item.price}"
    end

    input = gets.to_i 
    @main_dish.each_with_index do |item, index|
      if input - 1 == index
        @cartprice << item.price
        @carttotal << item.name
      end
    end

    case input
      when 1
        puts "You chose Meat."
        side_menu
      when 2
        puts "You chose Chicken."
        side_menu
      when 3
        puts "You chose Veggie Bowl."
        side_menu
      else
        puts "Invalid input, try again."
        side_menu
    end
  end

  def side_menu
    puts "What do you want as a side?"
    @side_dish.each_with_index do |item, index|
      puts "#{index+1}) #{item.name} - $#{item.price}"
    end

    puts "4) Choose this if that's all."
    puts "5) Choose this if you want to start over."
    input = gets.to_i 

    @side_dish.each_with_index do |item, index|
      if input - 1 == index
        @cartprice << item.price
        @carttotal << item.name
      end
    end

    case input
      when 1
        puts "You chose salad."
        side_menu
      when 2
        puts "You chose rice."
        side_menu
      when 3
        puts "You chose fries."
        side_menu
      when 4
        total
      when 5
        start_over
      else
        puts "Invalid input, try again."
        side_menu
    end
  end

  def total
    puts "Your order is: #{@carttotal.join(', ')}"
    puts "Your total is $#{@cartprice.sum}."
    puts "Pay on the next window"
  end

  def start_over
    puts "Your cart is empty. Choose your lunch again."
    @cartprice.clear
    @carttotal.clear
    main_menu
  end
end
LunchLady.new



