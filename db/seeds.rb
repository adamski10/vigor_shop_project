require('pry')
require_relative('../models/product')
require_relative('../models/manufacturer')

manufacturer1 = Manufacturer.new({
  "name" => "Doves Farms",
  "category" => "Flour",
  "contact_details" => "Hungerford, RG17 0RF"
})

manufacturer2 = Manufacturer.new({
  "name" => "Juste Bio",
  "category" => "Nuts",
  "contact_details" => "France, 0033 234 579"
})

manufacturer3 = Manufacturer.new({
  "name" => "Kiril Mischeff Limited",
  "category" => "Oil",
  "contact_details" => "Notts, S81 7QF"
})

manufacturer4 = Manufacturer.new({
  "name" => "Little Salked Watermill",
  "category" => "Flour",
  "contact_details" => "Penrith, CA10 INN"
})

manufacturer1.save()
manufacturer2.save()
manufacturer3.save()
manufacturer4.save()


product1 = Product.new({
  "name" => "Organic Spelt flour",
  "category" => "Flour",
  "manufacturer_id" => 1,
  "buying_price" => 1.20,
  "markup" => 0.40,
  "units" => "kg",
  "stock_level" => 35
})

product2 = Product.new({
  "name" => "Organic cashew nuts",
  "category" => "Nuts",
  "manufacturer_id" => 2,
  "buying_price" => 0.80,
  "markup" => 0.40,
  "units" => "kg",
  "stock_level" => 20
})

product3 = Product.new({
  "name" => "Cold pressed olive oil",
  "category" => "Oil",
  "manufacturer_id" => 3,
  "buying_price" => 1.50,
  "markup" => 0.40,
  "units" => "ltr",
  "stock_level" => 40
})

product4 = Product.new({
  "name" => "Organic Rye flour",
  "category" => "Flour",
  "manufacturer_id" => 4,
  "buying_price" => 1.20,
  "markup" => 0.40,
  "units" => "kg",
  "stock_level" => 35
})


product1.save()
product2.save()
product3.save()
product4.save()

binding.pry
nil