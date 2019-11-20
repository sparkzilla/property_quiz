require('pry')
require_relative('models/property')


property1 = Property.new({
  'address' => '123 Acacia Avenue',
  'value' => 250000,
  'bedrooms' => 3,
  'year_built' => '1985'
})


property1.save()

binding.pry

nil
