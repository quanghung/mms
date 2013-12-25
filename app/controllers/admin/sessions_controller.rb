class Admin::SessionsController < ApplicationController
  def new
  end

  def create
  	admin = Admin.find_by email: params[:session][:email].downcase
    if admin && admin.authenticate(params[:session][:password])
      admin_sign_in! admin
      redirect_to admin_root_path
    else
      flash[:error] = I18n.t ".messages.errors.login"
      redirect_to admin_signin_path
    end
  end

  def destroy
    admin_sign_out!
    redirect_to admin_root_path
  end
end