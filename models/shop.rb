require_relative('../db/sql_runner.rb')
require_relative('./product')
require_relative('./manufacturer')
require('pry')

class Shop


  def Shop.stock_value()
    stock_numbers = Product.find_stock_level()
    buying_prices = Product.find_buying_price()
    values = stock_numbers.zip(buying_prices).map{|stock_number, buying_price| stock_number * buying_price}
    total = values.inject(:+)
    return total
  end

binding.pry
nil

end