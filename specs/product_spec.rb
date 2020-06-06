require('Minitest/autorun')
require('Minitest/reporters')
require_relative('../models/product.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestProduct < MiniTest::Test

  def setup
    options = {"id" => 1, "manufacturer_id" => 1, "name" => "Organic flour", "category" => "flour", 
    "buying_price" => 1.20, "markup" => 0.40, "stock_level" => 35}

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

  def test_buying_price()
    result = @organic_flour.buying_price()
    assert_equal(1.20, result)
  end

  def test_markup()
    result = @organic_flour.markup()
    assert_equal(0.40, result)
  end

  def test_stock_level()
    result = @organic_flour.stock_level()
    assert_equal(35, result)
  end

  def test_retail_price()
    result = @organic_flour.retail_price
    assert_equal(1.68, result)
  end

end