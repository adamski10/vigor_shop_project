require('pry')
require_relative('../models/product')
require_relative('../models/manufacturer')

manufacturer1 = Manufacturer.new({
  "name" => "Doves Farms",
  "category" => "flour",
  "contact_details" => "Hungerford, RG17 0RF"
})

manufacturer2 = Manufacturer.new({
  "name" => "Juste Bio",
  "category" => "nuts",
  "contact_details" => "France, 0033 234 579"
})

manufacturer3 = Manufacturer.new({
  "name" => "Kiril Mischeff Limited",
  "category" => "oil",
  "contact_details" => "Notts, S81 7QF"
})

manufacturer1.save()
manufacturer2.save()
manufacturer3.save()


product1 = Product.new({
  "name" => "Organic Spelt flour",
  "category" => "flour",
  "manufacturer_id" => 1,
  "wholesale_price" => 1.20,
  "markup" => 0.40,
  "stock_level" => 35
})

product2 = Product.new({
  "name" => "Organic cashew nuts",
  "category" => "nuts",
  "manufacturer_id" => 2,
  "wholesale_price" => 0.80,
  "markup" => 0.40,
  "stock_level" => 20
})

product3 = Product.new({
  "name" => "Cold pressed olive oil",
  "category" => "oil",
  "manufacturer_id" => 3,
  "wholesale_price" => 1.50,
  "markup" => 0.40,
  "stock_level" => 40
})

product1.save()
product2.save()
product3.save()

binding.pry
nil