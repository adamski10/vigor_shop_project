require_relative('../db/sql_runner.rb')

class Product

  attr_accessor :manufacturer_id, :name, :category, :buying_price, :markup, :stock_level
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @category = options['category']
    @manufacturer_id = options['manufacturer_id'].to_i
    @buying_price = options['buying_price'].to_f
    @markup = options['markup'].to_f
    @stock_level = options['stock_level']
  end

  def retail_price()
    retail_price = (@buying_price * @markup) + @buying_price
    return retail_price.to_f
  end

  def save()
    sql = "INSERT INTO products
    (
      name,
      category,
      manufacturer_id,
      buying_price,
      markup,
      stock_level
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING *"
    values = [@name, @category, @manufacturer_id, @buying_price, @markup, @stock_level]
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
    sql = "SELECT manufacturers.name FROM manufacturers
    WHERE manufacturers.id = $1"
    values = [@manufacturer_id]
    manufacturer = SqlRunner.run(sql, values)
    result = Manufacturer.new(manufacturer.first)
    return result.name
  end

  def self.find(id)
    sql = "SELECT * FROM products
    WHERE products.id = $1"
    values = [id]
    product = SqlRunner.run(sql, values)
    return Product.new(product.first)
  end

  def update()
    sql = "UPDATE products
    SET
    (
      name,
      category,
      buying_price,
      markup,
      stock_level
    ) =
    (
      $1, $2, $3, $4, $5
    )
    WHERE id = $6"
    values = [@name, @category, @buying_price, @markup, @stock_level, @id]
    SqlRunner.run(sql,values)
  end
end
