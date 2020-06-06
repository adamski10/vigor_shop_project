require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative( './models/product' )
require_relative( './models/manufacturer' )

also_reload( './models/*' )

get '/products' do
  @products  = Product.all()
  erb( :index )
end

get '/products/new_product' do
  @manufacturers = Manufacturer.all()
  erb( :new_product)
end

# get '/manufacturers' do
#   @manufacturers = Manufacturer.all
# end