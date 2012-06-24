class User < ActiveRecord::Base
  has_many :trips
  has_many :received_requests, :foreign_key => "requestee_id", class_name: "Request"
  has_many :sent_requests, :foreign_key => "requester_id", class_name: "Request"
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_attached_file :photo

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :photo
  # attr_accessible :title, :body
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def received_requests
    #unless user.requests.nil?
    Request.find_all_by_requestee_id_and_status(id, "pending")
  end
  
  def accepted_requests
    Request.find_all_by_requester_id_and_status(id, "accepted")
  end
  
  def rejected_requests
    Request.find_all_by_requester_id_and_status(id, "rejected")
  end
  
  def pending_requests
    Request.find_all_by_requester_id_and_status(id, "pending")
  end
end
