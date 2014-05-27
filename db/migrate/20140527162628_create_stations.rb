class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.integer :station_id
      t.integer :avail_bikes
      t.integer :avail_docks

      t.timestamps
    end
  end
end
