class Admin::StaticPagesController < ApplicationController
  before_action :signed_in_admin

  def index
  end
end