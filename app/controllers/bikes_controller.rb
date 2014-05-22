
class BikesController < ApplicationController
  def index
    all_stations = Citibikenyc.stations["results"]
    @ferry = all_stations.select {|x| x["id"]==514}


  end

end
