require('pry')
require_relative('../models/category')
require_relative('../models/product')
require_relative('../models/manufacturer')
require_relative('../models/shop')

category1 = Category.new({
  "name" => "Dairy"
})
category2 = Category.new({
  "name" => "Flour"
})
category3 = Category.new({
  "name" => "Fruit"
})
category4 = Category.new({
  "name" => "Grain"
})
category5 = Category.new({
  "name" => "Honey"
})
category6 = Category.new({
  "name" => "Nuts"
})
category7 = Category.new({
  "name" => "Oil"
})
category8 = Category.new({
  "name" => "Vegetables"
})

category1.save()
category2.save()
category3.save()
category4.save()
category5.save()
category6.save()
category7.save()
category8.save()

manufacturer1 = Manufacturer.new({
  "name" => "Doves Farms",
  "category_id" => 2,
  "contact_details" => "Hungerford, RG17 0RF"
})

manufacturer2 = Manufacturer.new({
  "name" => "Juste Bio",
  "category_id" => 7,
  "contact_details" => "France, 0033 234 579"
})

manufacturer3 = Manufacturer.new({
  "name" => "Kiril Mischeff Limited",
  "category_id" => 6,
  "contact_details" => "Notts, S81 7QF"
})

manufacturer4 = Manufacturer.new({
  "name" => "Little Salked Watermill",
  "category_id" => 4,
  "contact_details" => "Penrith, CA10 INN"
})

manufacturer1.save()
manufacturer2.save()
manufacturer3.save()
manufacturer4.save()


product1 = Product.new({
  "name" => "Organic Spelt flour",
  "category_id" => 2,
  "manufacturer_id" => 1,
  "buying_price" => 1.20,
  "markup" => 0.40,
  "units" => "kg",
  "stock_level" => 35
})

product2 = Product.new({
  "name" => "Organic cashew nuts",
  "category_id" => 6,
  "manufacturer_id" => 2,
  "buying_price" => 0.80,
  "markup" => 0.40,
  "units" => "kg",
  "stock_level" => 20
})

product3 = Product.new({
  "name" => "Cold pressed olive oil",
  "category_id" => 7,
  "manufacturer_id" => 3,
  "buying_price" => 1.50,
  "markup" => 0.40,
  "units" => "ltr",
  "stock_level" => 40
})

product4 = Product.new({
  "name" => "Organic Rye flour",
  "category_id" => 2,
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