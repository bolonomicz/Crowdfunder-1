class SessionsController < ApplicationController
  def new
  end

  def create
  	
  	if user = login(params[:email], params[:password])
  		redirect_to root_url, :notice => "Login successfull"
  	else
  		flash.now.alert = "Invalid"
  	end
  end

  def destroy
  	logout
  	redirect_to root_url, :notice => "Bye"
  end
end
