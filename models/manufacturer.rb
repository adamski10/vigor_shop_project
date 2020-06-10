require_relative('../db/sql_runner.rb')

class Manufacturer

  attr_accessor  :name, :category_id, :contact_details
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @category_id = options['category_id']
    @contact_details = options['contact_details']
  end

  def save()
    sql = "INSERT INTO manufacturers
    (
      name,
      category_id,
      contact_details
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING *"
    values = [@name, @category_id, @contact_details]
    manufacturer_data = SqlRunner.run(sql, values)
    @id = manufacturer_data.first()['id'].to_i
  end
  
  def Manufacturer.all()
    sql = "SELECT * FROM manufacturers"
    manufacturers = SqlRunner.run(sql)
    result = manufacturers.map { |manufacturer| Manufacturer.new(manufacturer)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM manufacturers
    WHERE id = $1"
    values = [id]
    manufacturer = SqlRunner.run(sql, values)
    return Manufacturer.new(manufacturer.first)
  end

  def self.find_by_category(category)
    sql = "SELECT manufacturers.* FROM manufacturers
    INNER JOIN categories
    ON manufacturers.category_id = categories.id
    WHERE categories.name = $1"
    values = [category]
    manufacturers = SqlRunner.run(sql, values)
    result = manufacturers.map { |manufacturer| Manufacturer.new(manufacturer) }
    return result
  end
  
  def update()
    sql = "UPDATE manufacturers
    SET
    (
      name,
      category_id,
      contact_details
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@name, @category_id, @contact_details, @id]
    SqlRunner.run(sql, values)
  end
end