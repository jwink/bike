class Station < ActiveRecord::Base

  def self.update_bike_data
    all_station_data = Citibikenyc.stations
    last_update = Time.at(all_station_data["lastUpdate"])
    binding.pry
    station_specific_data = all_station_data["results"]
    station_specific_data.each do |station|
      Station.create(station_id: station["id"],
                     avail_bikes: station["availableBikes"],
                     avail_docks: station["availableDocks"],
                     status: station["status"],
                     last_update: last_update)
    end

  end
end
