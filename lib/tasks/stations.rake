namespace :stations do
  desc "TODO"
  task pull_data: :environment do
    Station.update_bike_data
  end

end
