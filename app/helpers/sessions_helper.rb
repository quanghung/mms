module SessionsHelper
  def sign_in! user
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute :remember_token, User.encrypt(remember_token)
    self.current_user = user
  end
  
  # def admin_sign_in! admin
  #   remember_token = User.new_remember_token
  #   cookies.permanent[:remember_token] = remember_token
  #   admin.update_attribute :remember_token, User.encrypt(remember_token)
  #   self.current_admin = admin
  # end
  
  def current_user= user
    @current_user = user
  end
  
  # def current_admin= admin
  #   @current_admin = admin
  # end
  
  def current_user
    remember_token = User.encrypt cookies[:remember_token]
    @current_user ||= User.find_by remember_token: remember_token
  end

  def current_team
    return @current_user.team_id
  end

  def signed_in?
    current_user.present?
  end

  def admin_signed_in?
    current_user.isAdmin?
  end

  def sign_out!
    self.current_user = nil
    cookies.delete :remember_token
  end
  
  def signed_in_user
    unless signed_in?
      store_location!
      redirect_to signin_url, notice: "Please sign in."
    end
  end
  
  def admin_sign_out!
    self.current_admin= nil
    cookies.delete :remember_token
  end
  
  def signed_in_admin
    unless admin_signed_in?
      store_location!
      redirect_to signin_url, notice: "Please sign in."
    end
  end
  
  def store_location!
    session[:return_to] = request.url if request.get?
  end
end
