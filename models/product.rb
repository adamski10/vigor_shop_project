require_relative('../db/sql_runner.rb')

class Product

  attr_reader :id, :manufacturer_id, :name, :category, :wholesale_price, :markup, :stock_level

  def initialize(options)
    @id = options['id'] if options['id']
    @manufacturer_id = options['manufacturer.id']
    @name = options['name']
    @category = options['category']
    @wholesale_price = options['wholesale_price']
    @markup = options['markup']
    @stock_level = options['stock_level']
  end

end
