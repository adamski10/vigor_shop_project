require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative( '../models/product' )
require_relative( '../models/manufacturer' )
require_relative( '../models/shop' )
require_relative( '../models/category' )


also_reload( './models/*' )

get '/products' do
  @products  = Product.all()
  @categories = Category.all()
  erb( :"products/index" )
end

get '/products/new' do
  @manufacturers = Manufacturer.all()
  erb( :"products/new")
end

get '/products/low' do
  @products = Product.lowstock()
  erb( :"products/low")
end

get '/products/total' do
  @total = Shop.stock_value
  erb( :"products/total")
end

get '/products/:id' do
  @product = Product.find(params[:id])
  erb( :"products/show")
end

post '/products' do
  @product = Product.new(params)
  @product.save()
  redirect to '/products'
end

get '/products/:id/edit' do
  @product = Product.find( params[:id] )
  @manufacturers = Manufacturer.all()
  erb(:"products/edit")
end

post '/products/:id' do
  updated_product = Product.new( params )
  updated_product.update
  redirect to '/products'
end