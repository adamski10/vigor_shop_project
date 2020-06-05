class Manufacturer

  attr_reader :id, :name, :contact_details

  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
    @contact_details = options['contact_details']
  end
  
end