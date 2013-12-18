class TeamsController < ApplicationController
  before_action :signed_in_user

  def index
    @teams = Team.all.paginate page: params[:page]
  end
  
  def show
    @team = Team.find params[:id]
  end
end