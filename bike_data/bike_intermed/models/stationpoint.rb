class Stationpoint < ActiveRecord::Base

  require 'csv'

  def self.read_day(file)

  end

  def self.get_files
    x = CSV.read("../June5Bikes.csv")
    return x
  end

end
