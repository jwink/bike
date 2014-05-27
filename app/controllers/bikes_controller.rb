
class BikesController < ApplicationController
  def index
    all_stations = Citibikenyc.stations["results"]
    @ferry = all_stations.select {|x| x["id"]==514}
  end

  def annelaure
    @al = []
    all_stations = Citibikenyc.stations["results"]
    @al << all_stations.select {|x| x["id"]==537}
    @al << all_stations.select {|x| x["id"]==352}
    @al << all_stations.select {|x| x["id"]==446}
    @al << all_stations.select {|x| x["id"]==514}
  end

  def near
    station = params.fetch(:id)
    all_stations = Citibikenyc.stations["results"]
    curr_station = all_stations.select {|x| x["id"]==station.to_i}
    nearby = curr_station[0]["nearbyStations"]
    @al = []
    nearby.each do |s|
      @al << all_stations.select {|x| x["id"] == s["id"].to_i}
    end

  end

  def test
    Station.update_bike_data
    @p = Citibikenyc.stations
  end



end


