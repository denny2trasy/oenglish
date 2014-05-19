class WelcomeController < ApplicationController
  
  
  def index
    unless current_user.blank?
      path = root_path
      path = student_root_path if current_user.is_student?
      path = agent_root_path if current_user.is_agent?
      path = teacher_root_path if current_user.is_teacher?
      path = admin_root_path if current_user.is_admin?
      redirect_to path
    end
  end
  
end
