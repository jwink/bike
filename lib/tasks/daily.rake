namespace :daily do
  desc "TODO"
  task del_data: :environment do
    Station.delete_all
  end

end
