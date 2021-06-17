require './models/cost'

############################
# Calculates Grocery Prices
############################
class GroceryCalculator
  attr_reader :grocery_items

  def initialize(grocery_items)
    @grocery_items = grocery_items
  end

  def calculate
    current_grocery = grocery_items.first
    items_size = grocery_items.size
    item_count = 0
    total_price = 0.0
    total_saved = 0.0
    header
    grocery_items.each_with_index do |item, index|
      if item != current_grocery
        item_count, total_price, total_saved = print_line_item(current_grocery, item_count, total_price, total_saved)
      end
      current_grocery = item
      item_count += 1
      if index == items_size - 1
        item_count, total_price, total_saved = print_line_item(current_grocery, item_count, total_price, total_saved)
      end
    end
    footer(total_price, total_saved)
  end

  private

  def print_line_item(current_grocery, item_count, total_price, total_saved)
    line_cost, line_savings = line_item(current_grocery, item_count)
    total_price += line_cost
    total_saved += line_savings
    item_count = 0
    return item_count, total_price, total_saved
  end

  def line_item(item, item_count)
    cost, savings = Cost.new(item, item_count).calculate
    return 0, 0 unless cost > 0
    puts "#{show_value(item.capitalize, 15)} #{show_value(item_count, 12)} $#{cost}"
    return cost, savings
  end

  def footer(total_price, total_savings)
    puts ''
    puts "Total price : #{sprintf("$%2.2f", total_price)}"
    puts "You saved #{sprintf("$%2.2f", total_savings)} today."
  end

  def header
    puts 'Item           Quantity     Price'
    puts '----------------------------------------'
  end

  def show_value(value, column_size)
    value.to_s.ljust(column_size, ' ')
  end
end
