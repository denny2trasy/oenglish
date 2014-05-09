class SessionsController < Devise::SessionsController
  
  def create
    user = User.find_by_email(params[:user][:email])
    unless user.blank?
      if user.valid_password?(params[:user][:password])
        sign_in user
        respond_with user, :location => after_sign_in_path_for(user)
      else
        flash[:notice] = t(:invalid_password)
        redirect_to root_path
      end
    else
      flash[:notice] = t(:invalid_email)
      redirect_to root_path
    end
  end
  
end
