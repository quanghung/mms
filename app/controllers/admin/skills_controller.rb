class Admin::SkillsController < ApplicationController
  before_action :signed_in_user
  
  def index
    @skills = Skill.all.paginate page: params[:page], per_page: 1
  end

  def new
    @skill = Skill.new
  end

  def create
    skill = Skill.new skill_params
    if skill.save
      flash[:success] = I18n.t ".messages.add_user.success"
      redirect_to admin_skills_path
    else
      flash[:success] = I18n.t ".messages.add_user.unsuccess"
      render "new"
    end
  end

  def edit
    @skill = Skill.find params[:id]
  end

  def update
    skill = Skill.find params[:id]
    if skill.update_attributes skill_params
      flash[:success] = I18n.t ".messages.update.success"
      redirect_to admin_skills_path
    else
      flash[:success] = I18n.t ".messages.update.unsuccess"
      redirect_to "edit"
    end
  end

  def destroy
    skill = Skill.find params[:id]
    if skill.user_skills.count == 0 and skill.destroy!
        flash[:success] = I18n.t ".messages.delete_skill.success"
    else
      flash[:success] = I18n.t ".messages.delete_skill.unsuccess"
    end
    redirect_to admin_skills_path
  end

  private
  def skill_params
    params.require(:skill).permit :name
  end
end