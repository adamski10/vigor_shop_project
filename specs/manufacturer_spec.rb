require('Minitest/autorun')
require('Minitest/reporters')
require_relative('../models/manufacturer.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestProduct < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "Doves Farms", "contact_details" => "Hungerford, RG17 0RF"}

    @doves_farms = Manufacturer.new(options)
  end

  def test_name()
    result = @doves_farms.name
    assert_equal("Doves Farms", result)
  end

  def test_contact_details()
    result = @doves_farms.contact_details
    assert_equal("Hungerford, RG17 0RF", result)
  end


end