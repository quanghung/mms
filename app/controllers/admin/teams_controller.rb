class Admin::TeamsController < ApplicationController
  before_action :signed_in_user
  
  def index
   @teams = Team.all.paginate page: params[:page], per_page: 4
  end

  def new
    @team = Team.new
  end

  def create
    team = Team.new team_params
    if team.save
      flash[:success] = I18n.t ".messages.add_user.success"
      redirect_to admin_teams_path
    else
      flash[:success] = I18n.t ".messages.add_user.unsuccess"
      render "new"
    end
  end

  def edit
    @team = Team.find params[:id]
  end

  def update
    team = Team.find params[:id]
    if team.update_attributes team_params
      flash[:success] = I18n.t ".messages.update.success"
      redirect_to admin_teams_path
    else
      flash[:success] = I18n.t ".messages.update.unsuccess"
      redirect_to "edit"
    end
  end

  def destroy
    team = Team.find params[:id]
    if team.users.count == 0 and team.destroy!
      flash[:success] = I18n.t ".messages.delete_user.success"
    else
      flash[:success] = I18n.t ".messages.delete_user.unsuccess"
    end
    redirect_to admin_teams_path
  end

  private
  def team_params
    params.require(:team).permit :name, :descriptions
  end
end