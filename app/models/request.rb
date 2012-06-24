class Request < ActiveRecord::Base
  belongs_to :requestee, :foreign_key => :requestee_id
  belongs_to :requester, :foreign_key => :requester_id
  belongs_to :trip
  attr_accessible :requestee_id, :requester_id, :status
  
  def requester
    User.find(requester_id)
  end
  
  def requestee
    User.find(requestee_id)
  end
end
