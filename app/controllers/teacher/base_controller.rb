class Teacher::BaseController < ApplicationController
  layout "teacher"
  before_action :authenticate_user!
  before_filter :check_teacher?

  
  def check_teacher?
    redirect_to root_path unless current_user.is_teacher?
  end
  
  
end