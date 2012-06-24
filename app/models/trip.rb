class Trip < ActiveRecord::Base
  belongs_to :user
  
  has_many :users, :foreign_key => :passengers
  
  
  attr_accessible :date, :price, :start, :stop, :user_id
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :start, :stop, :date, :price, presence: true
end
