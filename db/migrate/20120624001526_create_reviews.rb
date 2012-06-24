class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content
      t.decimal :rating
      t.integer :author_id
      t.integer :user_id

      t.timestamps
    end
  end
end
