require 'minitest/autorun'
require './models/grocery_calculator'

describe GroceryCalculator do
  it 'counts the individual items' do
    counts = GroceryCalculator.new(%w[milk milk Pineapple]).calculate
  end
end
