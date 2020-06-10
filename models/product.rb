require_relative('../db/sql_runner.rb')

class Product

  attr_accessor :name, :category_id, :manufacturer_id, :buying_price, :markup, :units, :stock_level
  attr_reader :id 

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @category_id = options['category_id'].to_i
    @manufacturer_id = options['manufacturer_id'].to_i
    @buying_price = options['buying_price'].to_f
    @markup = options['markup'].to_f
    @units = options['units']
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
      category_id,
      manufacturer_id,
      buying_price,
      markup,
      units,
      stock_level
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    RETURNING *"
    values = [@name, @category_id, @manufacturer_id, @buying_price, @markup, @units, @stock_level]
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
    WHERE id = $1"
    values = [id]
    product = SqlRunner.run(sql, values)
    return Product.new(product.first)
  end

  def self.find_by_category(category)
    sql = "SELECT products.* FROM products
    INNER JOIN categories
    ON products.category_id = categories.id
    WHERE categories.name = $1"
    values = [category]
    products = SqlRunner.run(sql, values)
    result = products.map { |product| Product.new(product) }
    return result
  end

  def get_category_name()
    sql = "SELECT categories.name FROM categories
    INNER JOIN products
    ON products.category_id = categories.id
    WHERE products.id = $1"
    values = [id]
    name = SqlRunner.run(sql, values)
    return name
  end

  def self.lowstock()
    sql = "SELECT * FROM products
    WHERE products.stock_level <= $1"
    values = [5]
    products = SqlRunner.run(sql, values)
    result = products.map { |product| Product.new(product) }
    return result
  end

  def update()
    sql = "UPDATE products
    SET
    (
      name,
      category_id,
      manufacturer_id,
      buying_price,
      markup,
      units,
      stock_level
    ) =
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    WHERE id = $8"
    values = [@name, @category_id, @manufacturer_id, @buying_price, @markup, @units, @stock_level, @id]
    SqlRunner.run(sql, values)
  end

  def Product.find_stock_level()
    sql = "SELECT products.stock_level
    FROM products"
    product_data = SqlRunner.run(sql)
    stock = product_data.map {|product| product['stock_level'].to_i}
    return stock
  end

  def Product.find_buying_price()
    sql = "SELECT products.buying_price
    FROM products"
    product_data = SqlRunner.run(sql)
    buying_price = product_data.map {|product| product['buying_price'].to_f}
    return buying_price
  end

end
