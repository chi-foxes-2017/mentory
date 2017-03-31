class ChangeDefaultValueOnUrlInUsersTableToFaker < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :url, :string, :default => Faker::Avatar.image
  end
end
