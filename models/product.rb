require('../db/sql_runner.rb')

class Product

  attr_reader :id, :manufacturer_id, :name, :type, :wholesale_price, :markup :retail_price, :stock_level

  def initialize(options)
    @id = options['id'] if options['id']
    @manufacturer_id = options['manufacturer.id']
    @name = options['name']
    @type = options['type']
    @wholesale_price = options['wholesale_price']
    @markup = options['markup']
    @retail_price = options['sale_price']
    @stock_level = options['stock_level']
  end

end
