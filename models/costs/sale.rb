#
# Calculates Grocery Prices
#
module Costs
  class Sale
    def initialize(item_count)
      @item_count = item_count
    end

    def price(amount, price)
      return 0 unless amount <= @item_count
      (@item_count / amount) * price
    end

    def non_sale_count(amount)
      @item_count % amount
    end
  end
end
