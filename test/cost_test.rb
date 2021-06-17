require 'minitest/autorun'
require './models/cost'

describe Cost do
  it 'returns the cost of 3 milks' do
    price, saving = Cost.new('milk', 3).calculate
    assert_equal(8.97, price)
    assert_equal(2.94, saving)
  end

  it 'returns the cost of 2 milks' do
    price, saving = Cost.new('milk', 2).calculate
    assert_equal(5, price)
  end

  it 'returns the cost of 4 breads' do
    price, saving = Cost.new('bread', 4).calculate
    assert_equal(8.17, price)
  end

  it 'returns the cost of 1 apple' do
    price, saving = Cost.new('apple', 1).calculate
    assert_equal(0.89, price)
  end

  it 'returns the cost of 0 for non groceries' do
    price, saving = Cost.new('hello', 1).calculate
    assert_equal(0.00, price)
    assert_equal(0.00, saving)
  end
end
