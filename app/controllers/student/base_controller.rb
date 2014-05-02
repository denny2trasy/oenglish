class Student::BaseController < ApplicationController
  layout "student"
  before_action :authenticate_user!
  before_filter :check_student?
  
  def check_student?
    redirect_to root_path unless current_user.is_student?
  end

end