require('Minitest/reporters')
require('Minitest/autorun')
require_relative('../models/product.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestProduct < MiniTest::Test

  def setup
    options = {"id" => 1, "manufacturers_id" => 1, "name" => "Organic flour", "category" => "flour", 
    "wholesale_price" => 0.5, "markup" => 0.15, "stock_level" => 35}

    @organic_flour = Product.new(options)
  end

end