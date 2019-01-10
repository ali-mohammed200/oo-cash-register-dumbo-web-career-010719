require 'pry'
class CashRegister
  attr_accessor :total
  attr_reader :discount, :items
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @items_hash = {}
  end
  def add_item(item, price, quantity = 1)
    quantity.times do
      @items.push(item)
    end
    @items_hash[item] = {:price => price, :quantity => quantity}
    @total += (price * quantity)

  end
  def apply_discount
    if @discount != 0
      @total *= ((100 - @discount.to_f)/100)
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end
  def void_last_transaction
    last_item = @items.pop
    @items_hash[last_item][:quantity] -= 1
    @total -= @items_hash[last_item][:price]
  end
end
