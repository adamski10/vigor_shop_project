require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative( 'controllers/products_controller' )
require_relative( 'controllers/manufacturers_controller' )

also_reload( './models/*' )

get '/' do
  erb ( :index )
end

set :bind, '0.0.0.0'