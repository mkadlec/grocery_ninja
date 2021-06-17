require './models/grocery_items'
require './models/grocery_calculator'

puts 'Please enter all the items purchased separated by a comma'
grocery_item_input = gets.chomp
grocery_items = GroceryItems.sorted_items(grocery_item_input)

GroceryCalculator.new(grocery_items).calculate


