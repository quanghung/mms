class Admin::UsersController < ApplicationController
	before_action :signed_in_admin

	def index
		if params[:team_id]
			team = Team.find params[:team_id]
			@users = User.current_members_team(team)
			  .paginate(page: params[:page]) if team
    else
		  @users = User.all.paginate page: params[:page]
		end
		@teams = Team.all
	end
	
	def show
		@user = User.find params[:id]
	end

	def new
		@positions = Position.all
		@user = User.new
	end

	def create
		@positions = Position.all
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
		user.not_destroy = true
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