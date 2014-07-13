require 'bundler/setup'
Bundler.require

require_relative 'models/stationpoint'
require_relative 'models/average'

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


get '/what' do
  y = Average.where(station_id: 72)
  z = y.as_json
  @x = z[0]['station_id']

  erb :index
  #@x = z['station_id']
  #send_data Average.make_csv_averages, :filename => 'averages.csv'
end
