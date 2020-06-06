require('pry')
require_relative('../models/product')
require_relative('../models/manufacturer')

manufacturer1 = Manufacturer.new({
  "name" => "Doves Farms",
  "contact_details" => "Hungerford, RG17 0RF"
})

manufacturer2 = Manufacturer.new({
  "name" => "Juste Bio",
  "contact_details" => "France, 0033 234 579"
})

manufacturer3 = Manufacturer.new({
  "name" => "Kiril Mischeff Limited",
  "contact_details" => "Notts, S81 7QF"
})

manufacturer1.save()
manufacturer2.save()
manufacturer3.save()


product1 = Product.new({
  "manufacturer_id" => 1,
  "name" => "Organic Spelt flour",
  "category" => "flour",
  "wholesale_price" => 1.20,
  "markup" => 0.40,
  "stock_level" => 35
})

product2 = Product.new({
  "manufacturer_id" => 2,
  "name" => "Organic cashew nuts",
  "category" => "nuts",
  "wholesale_price" => 0.80,
  "markup" => 0.40,
  "stock_level" => 20
})

product3 = Product.new({
  "manufacturer_id" => 3,
  "name" => "Cold pressed olive oil",
  "category" => "oil",
  "wholesale_price" => 1.50,
  "markup" => 0.40,
  "stock_level" => 40
})

product1.save()
product2.save()
product3.save()

binding.pry
nil