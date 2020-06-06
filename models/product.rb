require_relative('../db/sql_runner.rb')

class Product

  attr_reader :id, :manufacturer_id, :name, :category, :wholesale_price, :markup, :stock_level

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @category = options['category']
    @manufacturer_id = options['manufacturer_id'].to_i
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
      name,
      category,
      manufacturer_id,
      wholesale_price,
      markup,
      stock_level
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING *"
    values = [@name, @category, @manufacturer_id, @wholesale_price, @markup, @stock_level]
    product_data = SqlRunner.run(sql, values)
    @id = product_data.first()['id'].to_i
  end
  
  def self.all()
    sql = "SELECT * FROM products"
    products = SqlRunner.run(sql)
    result = products.map { |product| Product.new(product)}
    return result
  end

  def manufacturer()
    sql = "SELECT * FROM manufacturers
    WHERE manufacturers.id = $1"
    values = [@manufacturer_id]
    manufacturer = SqlRunner.run(sql, values)
    result = Manufacturer.new(manufacturer.first)
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM products
    WHERE products.id = $1"
    values = [id]
    product = SqlRunner.run(sql, values)
    return Product.new(product.first)
  end
end
