class Admin::UsersController < ApplicationController
	before_action :signed_in_user

	def index
    	@users = User.all.paginate page: params[:page], per_page:4
	end
	
	def show
		@user = User.find params[:id]
	end

	def new
		@positions = Position.all
		@teams = Team.all
		# @skills = Skill.all
		@user = User.new
		Skill.all.each do |skill|
			@user.user_skills.build(skill_id: skill.id)
		end
	end

	def create
		@user = User.new user_params
	    if @user.save
	      flash[:success] = I18n.t ".messages.add_user.success"
	      redirect_to admin_users_path
	    else
	      flash[:success] = I18n.t ".messages.add_user.unsuccess"
	      render "new"
	    end
	end

	def edit
		@user = User.find params[:id]
		@positions = Position.all
		@position = Position.find @user.position_id
		@teams = Team.all
		@team = Team.find @user.team_id
	end

	def update
		@user = User.find params[:id]
		if @user.update_attributes! user_params
			  flash[:success] = I18n.t ".messages.update.success"
	      redirect_to admin_user_path @user
	    else
	      flash[:success] = I18n.t ".messages.update.unsuccess"
	      redirect_to "edit"
	    end
	end

	def destroy
		user = User.find params[:id]
		user.not_validates_password = true
		if user.update_attributes! active_flag: false
			flash[:success] = I18n.t ".messages.delete_user.success"
		else
		  flash[:success] = I18n.t ".messages.delete_user.unsuccess"
		end
		redirect_to admin_users_path
	end

	private
	  def user_params
	    params.require(:user).permit :name, :password,
	      :password_confirmation, :email, :isAdmin, :position_id, :team_id, :birthday, 
	      user_skills_attributes: [:level, :experience_year, :skill_id, :user_id]
	  end
end