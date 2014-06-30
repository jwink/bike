require 'bundler/setup'
Bundler.require

require_relative 'models/stationpoint'

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'all_bike_data'
)


get '/' do

  #x = Stationpoint.all
  x = Stationpoint.get_files
  @stationpoints = x[1]
  erb :index
end
