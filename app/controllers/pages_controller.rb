class PagesController < ApplicationController
  def index
    @user = current_user
    unless @user.nil?
      @received_requests = @user.received_requests
      @accepted_requests = @user.accepted_requests
      @rejected_requests = @user.rejected_requests
      @pending_requests = @user.pending_requests
    end
  end  
end
