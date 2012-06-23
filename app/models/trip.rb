class Trip < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date, :price, :start, :stop, :user_id
end
