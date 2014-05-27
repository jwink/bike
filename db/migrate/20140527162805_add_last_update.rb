class AddLastUpdate < ActiveRecord::Migration
  def change
    add_column :stations, :last_update, :datetime
  end
end
