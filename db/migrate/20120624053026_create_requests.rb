class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :requester_id
      t.integer :requestee_id
      t.string :status

      t.timestamps
    end
  end
end
