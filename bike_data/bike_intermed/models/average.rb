
class Average < ActiveRecord::Base

def self.make_csv_averages
    data = Average.all
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
