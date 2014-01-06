class Admin::StaticPagesController < ApplicationController
  before_action :signed_in_user

  def index
  end
end