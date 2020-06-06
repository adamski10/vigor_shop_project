require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative( './models/product' )
require_relative( './models/manufacturer' )

also_reload( './models/*' )