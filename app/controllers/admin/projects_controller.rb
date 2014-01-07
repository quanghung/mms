class Admin::ProjectsController < ApplicationController
  # before_action :signed_in_admin
  
  def index
    @projects = Project.all.paginate page: params[:page]
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.new project_params
    if project.save
      flash[:success] = I18n.t ".messages.add_project.success"
      redirect_to admin_projects_path
    else
      flash[:success] = I18n.t ".messages.add_project.unsuccess"
      render "new"
    end
  end

  def edit
    @project = Project.find params[:id]
  end

  def update
    project = Project.find params[:id]
    if project.update_attributes project_params
      flash[:success] = I18n.t ".messages.update.success"
      redirect_to admin_projects_path
    else
      flash[:success] = I18n.t ".messages.update.unsuccess"
      redirect_to "edit"
    end
  end

  def destroy
    project = Project.find params[:id]
    if project.project_users.count == 0 and project.destroy!
        flash[:success] = I18n.t ".messages.delete_skill.success"
    else
    	flash[:success] = I18n.t ".messages.delete_skill.unsuccess"
    end
    redirect_to admin_projects_path
  end

  private
  def project_params
    params.require(:project).permit :name, :short_name, :start_date, :end_date, :team_id
  end
end