class Admin::ProjectsController < ApplicationController
  # before_action :signed_in_admin
  
  def index
    @projects = Project.all.paginate page: params[:page]
  end
end