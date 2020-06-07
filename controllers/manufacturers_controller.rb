require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative( '../models/product' )
require_relative( '../models/manufacturer' )

also_reload( './models/*' )

get '/manufacturers' do
  @products  = Manufacturer.all()
  erb( :"manufacturers/index" )
end

get '/msnufscturers/new' do
  erb( :"manufacturers/new")
end

post '/manufacturers' do
  @manufacturer = Manufacturer.new(params)
  @manufacturer.save()
  redirect to '/manufacturers'
end