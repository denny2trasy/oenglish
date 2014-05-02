class Admin::BaseController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_filter :check_admin?
  
  def check_admin?
    redirect_to root_path unless current_user.is_admin?
  end
  
end