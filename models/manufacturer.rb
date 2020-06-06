class Manufacturer

  attr_reader :id, :name, :category, :contact_details

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @category = options['category']
    @contact_details = options['contact_details']
  end

  def save()
    sql = "INSERT INTO manufacturers
    (
      name,
      category,
      contact_details
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING *"
    values = [@name, @category, @contact_details]
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
    WHERE manufacturers.id = $1"
    values = [id]
    manufacturer = SqlRunner.run(sql, values)
    return Manufacturer.new(manufacturer.first)
  end
  
end