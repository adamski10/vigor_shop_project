class Manufacturer

  attr_reader :id, :name, :contact_details

  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
    @contact_details = options['contact_details']
  end

  def save()
    sql = "INSERT INTO manufacturers
    (
      name,
      contact_details
    )
    VALUES
    (
      $1, $2
    )
    RETURNING *"
    values = [@name, @contact_details]
    manufacturer_data = SqlRunner.run(sql, values)
    @id = manufacturer_data.first()['id'].to_i
  end
  
  def Manufacturer.all()
    sql = "SELECT * FROM manufacturers"
    manufacturers = SqlRunner.run(sql)
    result = manufacturers.map { |manufacturer| Product.new(manufacturer)}
    return result
  end
  
end