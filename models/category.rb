require_relative('../db/sql_runner.rb')
require_relative('./product')
require_relative('./manufacturer')
require('pry')

class Category

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
  end


  def save()
    sql = "INSERT INTO categories
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING *"
    values = [@name]
    category_data = SqlRunner.run(sql, values)
    @id = category_data.first()['id'].to_i
  end
  
  def self.all()
    sql = "SELECT * FROM categories"
    categories = SqlRunner.run(sql)
    result = categories.map { |category| Category.new(category)}
    return result
  end


  def self.find(id)
    sql = "SELECT * FROM categories
    WHERE id = $1"
    values = [id]
    category = SqlRunner.run(sql, values)
    return Category.new(category.first)
  end

  def update()
    sql = "UPDATE categories
    SET
    
      name
      
     =
    
      $1
    
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

end