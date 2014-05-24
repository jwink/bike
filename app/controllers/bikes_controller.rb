
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
  end



end
