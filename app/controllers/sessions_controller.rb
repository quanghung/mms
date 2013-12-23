class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      sign_in! user
      redirect_to root_path
    else
      flash[:error] = I18n.t ".messages.errors.login"
      redirect_to signin_path
    end
  end

  def destroy
    sign_out!
    redirect_to root_url
  end
end
