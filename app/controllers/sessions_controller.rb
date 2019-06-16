class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:user][:name])
    # p @user
    # p "Session Controller create"
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to '/'
  end

end
