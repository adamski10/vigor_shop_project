require_relative('../db/sql_runner.rb')

class Product

  attr_reader :id, :manufacturer_id, :name, :category, :wholesale_price, :markup, :stock_level

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @manufacturer_id = options['manufacturer_id'].to_i
    @name = options['name']
    @category = options['category']
    @wholesale_price = options['wholesale_price']
    @markup = options['markup']
    @stock_level = options['stock_level']
  end

  def retail_price()
    retail_price = (@wholesale_price * @markup) + @wholesale_price
    return retail_price
  end

  def save()
    sql = "INSERT INTO products
    (
      manufacturer_id,
      name,
      category,
      wholesale_price,
      markup,
      stock_level
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@manufacturer_id, @name, @category, @wholesale_price, @markup, @stock_level]
    product_data = SqlRunner.run(sql, values)
    @id = product_data.first()['id'].to_i
  end
  
  def Product.all()
    sql = "SELECT * FROM products"
    products = SqlRunner.run(sql)
    result = products.map { |product| Product.new(product)}
    return result
  end
end
