require './models/costs/sale'

############################
# Calculates Grocery Prices
############################
class Cost
  attr_reader :grocery, :count, :costs

  COSTS = {
    'milk': {
      unit: 3.97,
      sale: {
        quantity: 2,
        cost: 5.0
      }
    },
    'bread': {
      unit: 2.17,
      sale: {
        quantity: 3,
        cost: 6.0
      }
    },
    'banana': {
      unit: 0.99
    },
    'apple': {
      unit: 0.89
    }
  }

  def initialize(grocery, count)
    @grocery = grocery
    @count = count
  end

  def calculate
    cost = 0.0
    item_costs = COSTS[grocery.to_sym]
    unit_cost = item_costs[:unit] rescue 0
    sale_quantity = item_costs[:sale][:quantity] rescue 0
    sale_cost = item_costs[:sale][:cost] rescue 0
    unit_quantity = count
    if sale_quantity > 0
      sale_calculator = Costs::Sale.new(count)
      cost = cost + sale_calculator.price(sale_quantity, sale_cost)
      unit_quantity = sale_calculator.non_sale_count(sale_quantity)
    end
    cost = cost + unit_quantity * unit_cost
    return cost, saving_amount(unit_cost, count, cost)
  end

  private

  def saving_amount(unit_cost, quantity, total_cost)
    (unit_cost * quantity - total_cost).round(2)
  end
end


