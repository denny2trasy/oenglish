class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
  def after_sign_in_path_for(resource)
    if resource.is_admin?
      admin_root_path
    elsif resource.is_agent?
      agent_root_path
    elsif resource.is_teacher?
      teacher_root_path
    else
      student_root_path
    end
  end
  
  def oenglish_url(path)
  	 url = ""
  	 if Rails.env == "production"
       url = "http://www.oenglish.net/#{path}"
     else
       url = "http://localhost:3000/#{path}"
     end
     url
	end
  
end
