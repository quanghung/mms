class Admin::ProjectUsersController < ApplicationController
  # before_action :signed_in_admin
  def new
    @project = Project.find(params[:project_id])
    @team = @project.team
    @users = @team.users
    @project.team.users.each do |user| 
      unless @project.users.include?(user)
        @project.project_users.build user_id: user.id, project_id: @project.id
      end
    end
  end

  def create
    project = Project.find(params[:project_id])
    params[:project_users].each do |index, project_user| 
        leader_flag = (project_user[:user_id] == params[:leader_flag])
        if project_user[:id].blank?
          if !project_user[:user_id].nil?
            ProjectUser.create! project_id: project.id, user_id: project_user[:user_id], leader_flag: leader_flag
          end
        else
          temp = ProjectUser.find project_user[:id]
          if project_user[:user_id].nil?
            temp.destroy
          else
            temp.user_id = project_user[:user_id]
            temp.leader_flag = leader_flag
            temp.save!
          end
        end
    end
    redirect_to admin_projects_path
  end

end