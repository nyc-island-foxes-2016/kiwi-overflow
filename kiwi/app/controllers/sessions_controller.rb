class SessionsController < ApplicationController

  def new
  end

  def create
    binding.pry
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      login @user
      redirect_to root_path
    else
      flash[:notice] = "Invalid email or password"
      redirect_to new_session_path
    end
  end

  def destroy
    sessions.clear
    redirect_to root_path
  end

end