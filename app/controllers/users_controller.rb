class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		auto_login(@user)
  		redirect_to root_path, :alert => "Account created"

  	else
  		render :new, :alert => "Try again"
  	end
  end
end
