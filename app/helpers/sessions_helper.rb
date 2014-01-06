module SessionsHelper

  def sign_in! user
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.not_validates_password = true
    user.update_attributes! :remember_token => User.encrypt(remember_token)
    self.current_user = user
  end
  
  def signed_in?
    current_user.present?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token  = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  # def current_team
  #   return @current_user.team_id
  # end

  def current_team
    @current_user.team_members.each do |team_member|
      return team_member.team if team_member.current_member_team_flag == true
    end
  end

  def signed_in_user
    unless signed_in?
      store_location!
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def sign_out!
    self.current_user = nil
    cookies.delete :remember_token
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end
  
  def store_location!
    session[:return_to] = request.url if request.get?
  end
end
