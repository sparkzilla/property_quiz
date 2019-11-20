require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/property')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class PropertyTest < MiniTest::Test

def test_can_create_new_property

  property_details = {
    'address' => '123 Acacia Avenue',
    'value' => 250000,
    'bedrooms' => 3,
    'year_built' => '1985'
  }

  new_property = Property.new(property_details)
  assert_equal(250000, new_property.value)

end
end
