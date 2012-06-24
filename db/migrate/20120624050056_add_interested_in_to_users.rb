class AddInterestedInToUsers < ActiveRecord::Migration
  def change
    add_column :users, :interested_in, :string
  end
end
