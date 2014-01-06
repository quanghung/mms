class Admin::PositionsController < ApplicationController

  #before_action :signed_in_admin
  before_action :signed_in_user
  
  def index
   @positions = Position.all.paginate page: params[:page], per_page: 1
  end

  def new
    @position = Position.new
  end

  def create
    position = Position.new position_params
    if position.save
      flash[:success] = I18n.t ".messages.add_user.success"
      redirect_to admin_positions_path
    else
      flash[:success] = I18n.t ".messages.add_user.unsuccess"
      render "new"
    end
  end

  def edit
    @position = Position.find params[:id]
  end

  def update
    position = Position.find params[:id]
    if position.update_attributes position_params
      flash[:success] = I18n.t ".messages.update.success"
      redirect_to admin_positions_path
    else
      flash[:success] = I18n.t ".messages.update.unsuccess"
      redirect_to "edit"
    end
  end

#  def destroy
#    position = Position.find params[:id]
#    if position.update_attributes! active_flag: 0
#      flash[:success] = I18n.t ".messages.delete_user.success"
#      users = User.users_has_position position
#      users.each do |user|
#        user.not_destroy = true
#        user.update_attributes! active_flag: 0
#      end
#    else
#      flash[:success] = I18n.t ".messages.delete_user.unsuccess"
#    end
#  redirect_to admin_positions_path
 # end

  private
  def position_params
    params.require(:position).permit :name, :short_name
  end
end