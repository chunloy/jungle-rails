class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    
    #If user exists and entered correct password
    if user && user.authenticate(params[:password])
      #store user id in cookie
      session[:user_id] = user.id
      redirect_to [:root]
    else
      #if authentication fails redirect to login
      render [:new]
    end
  end

  def destroy
    session[:user_id]=nil
    render [:new]
  end
end
