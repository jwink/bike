namespace :daily do
  desc "TODO"
  task del_data: :environment do
    Station.make_csv_string
    Station.delete_all
  end

end
