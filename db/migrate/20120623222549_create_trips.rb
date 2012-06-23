class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :start
      t.string :stop
      t.date :date
      t.decimal :price
      t.integer :user_id

      t.timestamps
    end
  end
end
