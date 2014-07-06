
require 'csv'


class Station < ActiveRecord::Base


  def self.update_bike_data
    all_station_data = Citibikenyc.stations
    last_update = Time.at(all_station_data["lastUpdate"])
    station_specific_data = all_station_data["results"]
    station_specific_data.each do |station|
      Station.create(station_id: station["id"],
                     avail_bikes: station["availableBikes"],
                     avail_docks: station["availableDocks"],
                     status: station["status"],
                     last_update: last_update)
    end
  end

  def self.make_csv_string

    column_names = [:id,
                    :station_id,
                    :avail_bikes,
                    :avail_docks,
                    :created_at,
                    :updated_at,
                    :last_update,
                    :status]
    station_data = Station.all
    csv_string = CSV.generate do |csv|
      csv << column_names
      station_data.each do |station|
        csv << column_names.map {|key| station[key]}
      end
    end
    UserMailer.send_it(csv_string).deliver
    return csv_string
  end

  def self.make_csv_label
    all_station_data = Citibikenyc.stations["results"]
    column_names = [:id, :label, :latitude, :longitude, :n1, :n2, :n3, :n4, :n5, :d1, :d2, :d3, :d4, :d5]
    first_col_names = [:id, :label, :latitude, :longitude]
    csv_string = CSV.generate do |csv|
      csv << column_names
      all_station_data.each do |station|
        temp_array = []
        temp_array << first_col_names.map {|key| station[key]}
        station["nearbyStations"].each do |near_id|
          temp_array << near_id[:id]
        end
        station["nearbyStations"].each do |near_id|
          temp_array << near_id[:distance]
        end
        temp_array.flatten!
        csv << temp_array
      end
    end
    return csv_string
    #return all_station_data[0]
  end




end



    # t.integer  "station_id"
    # t.integer  "avail_bikes"
    # t.integer  "avail_docks"
    # t.datetime "created_at"
    # t.datetime "updated_at"
    # t.datetime "last_update"
    # t.string   "status"
