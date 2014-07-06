require 'bundler/setup'
Bundler.require

require_relative 'models/stationpoint'

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'all_bike_data'
)


get '/' do

  Stationpoint.file_loop
  y=Stationpoint.where(station_id: 514, hour: 19, day_of_week: [1,2,3,4])
  @x=y.to_json
  erb :index
end


get '/crunch' do

end
