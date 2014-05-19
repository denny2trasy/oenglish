class RegistrationsController < Devise::RegistrationsController
  
  def create
    # debugger
    user = User.new_with_session(user_params,session)
    
    begin      
      if user.save!
        if user.active_for_authentication?
          flash[:notice] = "Login Success"
          user
          sign_up(User, user)
          redirect_to root_path
        else
          flash[:notice] = "Register error"
          expire_data_after_sign_in!
          redirect_to(:back)
        end        
      end
    rescue Exception => e
      flash[:notice] = e.message
      clean_up_passwords user
      redirect_to(:back)
    end
    
  end
  
  private
  def user_params
      params.require(:user).permit("email", "password","password_confirmation", "name", "login", "qq", "weixin", "mobile", "agent_id", "u_type")
  end
  
end
