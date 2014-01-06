class UsersController < ApplicationController
  before_action :signed_in_user
  before_action :init_user_object
  before_action :correct_user, only: [:edit, :update]

  def show
  end
  
  private
  def init_user_object
    @team = Team.find params[:team_id]
    @user = @team.users.find params[:id]
  end

  def correct_user
    redirect_to root_url unless current_user? @user
  end

end