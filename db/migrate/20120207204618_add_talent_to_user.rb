class AddTalentToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :learning_interests, :string
    add_column :users, :teaching_interests, :string
    add_column :users, :location_id, :integer
    add_column :users, :avatar, :string
  end
end
