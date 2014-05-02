class Admin::UsersController < Admin::BaseController
  
  def index
    @q = User.search(params[:q])
    @users = @q.result(distinct: true).page(params[:page])
  end
  
  def new
    @user = User.new(user_params)
  end
  
  def create
    begin
      User.create!(user_params)
      flash[:notice] = "Success"
    rescue Exception => e
      flash[:notice] = e.message
    end
    redirect_to admin_users_path
  end
  
  def edit
    @user = User.find_by_id(params[:id])
    render (params[:flag].blank? ? "edit" : "password")
  end
  
  def update
    user = User.find_by_id(params[:id])
    begin
      user.update!(user_params)
      flash[:notice] = "Success"
    rescue Exception => e
      flash[:notice] = e.message
    end
    redirect_to admin_users_path
  end
  
  def show
    @user = User.find_by_id(params[:id])
  end
  
  def set_grade
    @user = User.find_by_id(params[:id])
    @grades = Grade.opened
  end
  
  # tomorrow do this at 20140502
  def do_set
    begin
      user = User.find_by_id(params[:id])
      user.grades_users.create!(:grade_id => params[:grade_id], :deadline => params[:deadline])
      flash[:notice] = "Set Success"
    rescue Exception => e
      flash[:notice] = "Set Fail, error message: #{e.message}"
    end
    redirect_to admin_users_path
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:login,:email,:password,:u_type)
  end
  
end
