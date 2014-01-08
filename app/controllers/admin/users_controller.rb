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
		@skills = Skill.all
		@user = User.new
	end

	def create
		@user = User.new user_params
	    if @user.save
	    	skills = params[:skills]
			levels = params[:levels]
			experience_years = params[:experience_years]
			index = 0
			skills.each do |skill_id|
				UserSkill.create! user_id: @user.id, skill_id: skill_id, level: levels[index], experience_year: experience_years[index]
				index = index + 1
			end
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
	      :password_confirmation, :email, :isAdmin, :position_id, :team_id, :birthday
	  end
end