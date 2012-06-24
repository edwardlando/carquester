class Trip < ActiveRecord::Base
  belongs_to :user
  
  has_many :users, :foreign_key => :passengers
  
  
  attr_accessible :date, :price, :start, :stop, :user_id
  validates :start, :stop, :date, presence: true
end
