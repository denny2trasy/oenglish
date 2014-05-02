class Admin::CoursesController < Admin::BaseController
  
  def index
    @q = Course.search(params[:q])
    @courses = @q.result(distinct: true).page(params[:page])
  end
  
  def new
    @course = Course.new
  end
  
  def create
    begin
      Course.create!(course_params)
      flash[:notice] = "Success"
    rescue Exception => e
      flash[:notice] = e.message
    end
    redirect_to admin_courses_path
  end
  
  def edit
    @course = Course.find_by_id(params[:id])
  end
  
  def update
    user = Course.find_by_id(params[:id])
    begin
      user.update!(course_params)
      flash[:notice] = "Success"
    rescue Exception => e
      flash[:notice] = e.message
    end
    redirect_to admin_courses_path
  end
  
  def destroy
    flash[:notice] = Course.find_by_id(params[:id]).destroy ? "Success" : "Fail"
    redirect_to admin_courses_path
  end
  

  private
  def course_params
    params.require(:course).permit(:position,:name,:desc)
  end
  
end
