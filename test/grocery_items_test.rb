require 'minitest/autorun'
require './models/grocery_items'

describe GroceryItems do
  it 'returns empty array if no input provided' do
    items = GroceryItems.sorted_items('')
    assert_equal([], items)
  end

  it 'returns the items sorted' do
    items = GroceryItems.sorted_items('milk, bread, milk, banana, milk')
    assert_equal(%w[banana bread milk milk milk], items)
  end
end
