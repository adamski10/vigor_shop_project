require('Minitest/autorun')
require('Minitest/reporters')
require_relative('../models/product.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestProduct < MiniTest::Test

  def setup
    options = {"id" => 1, "manufacturer_id" => 1, "name" => "Organic flour", "category" => "flour", 
    "wholesale_price" => 0.5, "markup" => 0.15, "stock_level" => 35}

    @organic_flour = Product.new(options)
  end

  def test_name()
    result = @organic_flour.name()
    assert_equal("Organic flour", result)
  end

  def test_category()
    result = @organic_flour.category()
    assert_equal("flour", result)
  end

end