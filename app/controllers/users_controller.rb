class UsersController < ApplicationController

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
  
  def edit
    @user = User.find(params[:id])
     respond_to do |format|
        format.html
        format.json { render json: @user }
      end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    @user.save
    redirect_to @user
  end

end
