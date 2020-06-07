require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative( '../models/product' )
require_relative( '../models/manufacturer' )

also_reload( './models/*' )

get '/products' do
  @products  = Product.all()
  erb( :"products/index" )
end

get '/products/new' do
  @manufacturers = Manufacturer.all()
  erb( :"products/new")
end

post '/products' do
  @product = Product.new(params)
  @product.save()
  redirect to '/products'
end