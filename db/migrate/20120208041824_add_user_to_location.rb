class AddUserToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :user_id, :integer
    remove_column :users, :location_id
  end
end
