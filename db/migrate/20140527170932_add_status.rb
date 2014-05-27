class AddStatus < ActiveRecord::Migration
  def change
    add_column :stations, :status, :string
  end
end
