class AddGenderToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :gender, :string
  end
end
