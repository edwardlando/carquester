class PagesController < ApplicationController
  def index
    @user = current_user
    @requests = @user.received_requests unless @user.nil?
  end  
end
