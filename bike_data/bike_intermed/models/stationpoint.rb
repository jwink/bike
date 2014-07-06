class Stationpoint < ActiveRecord::Base

  require 'csv'

  def self.read_day(file)

  end

  def self.get_files(filename)
    day_info = CSV.read(filename)
    Stationpoint.add_to_db(day_info)
  end


  def self.file_loop
    path = "../"
    for i in 3..3 do
      file = "July#{i}Bikes.csv"
      Stationpoint.get_files(path+file)
    end
  end

  def self.add_to_db(day_info)
    day_info.each do |observation|
      if observation[1] != "station_id"
        Stationpoint.add_record(observation)
      end
    end
  end

  def self.add_record(observation)

    field_hash = {}
    field_hash['id'] = 0
    field_hash['station_id'] = 1
    field_hash['avail_bikes'] = 2
    field_hash['avail_docks'] = 3
    field_hash['created_at'] = 4
    field_hash['updated_at'] = 5
    field_hash['last_update'] = 6
    field_hash['status'] = 7

    raw_time_as_string = observation[field_hash['last_update']]
    raw_time_as_date = DateTime.parse(raw_time_as_string)
    local_time = raw_time_as_date.to_time

    obs_hash = {}
    obs_hash['data_pull_id'] = observation[field_hash['id']]
    obs_hash['station_id'] = observation[field_hash['station_id']]
    obs_hash['year'] = local_time.year
    obs_hash['month'] = local_time.month
    obs_hash['day'] = local_time.day
    obs_hash['hour'] = local_time.hour
    obs_hash['day_of_week'] = local_time.wday
    obs_hash['avail_bikes'] = observation[field_hash['avail_bikes']]
    obs_hash['avail_docks'] = observation[field_hash['avail_docks']]
    obs_hash['created_at'] = observation[field_hash['created_at']]
    obs_hash['updated_at'] = observation[field_hash['updated_at']]
    obs_hash['last_update'] = observation[field_hash['last_update']]
    obs_hash['status'] = observation[field_hash['status']]

    if obs_hash['station_id'] == '72'
      #binding.pry
    end


    Stationpoint.create(obs_hash)
  end

end
