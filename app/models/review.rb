class Review < ActiveRecord::Base
  attr_accessible :author_id, :content, :rating, :user_id
  
  belongs_to :user, dependent: :destroy
  belongs_to :user, :foreign_key => :author_id
end
