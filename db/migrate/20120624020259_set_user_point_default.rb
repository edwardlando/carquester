class SetUserPointDefault < ActiveRecord::Migration
  def up
    change_column :users, :points, :decimal, :default => 0
    User.all.each do |user|
      user.points = 0
      user.save
    end
  end

  def down
  end
end
