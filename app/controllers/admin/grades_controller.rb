class Admin::GradesController < Admin::BaseController
  
  def index
    @q = Grade.search(params[:q])
    @grades = @q.result(distinct: true).page(params[:page])
  end
  
  def new
    @grade = Grade.new
  end
  
  def create
    begin
      Grade.create!(grade_params)
      flash[:notice] = "Success"
    rescue Exception => e
      flash[:notice] = e.message
    end
    redirect_to admin_grades_path
  end
  
  def edit
    @grade = Grade.find_by_id(params[:id])
  end
  
  def update
    user = Grade.find_by_id(params[:id])
    begin
      user.update!(grade_params)
      flash[:notice] = "Success"
    rescue Exception => e
      flash[:notice] = e.message
    end
    redirect_to admin_grades_path
  end
  
  def destroy
    flash[:notice] = Grade.find_by_id(params[:id]).destroy ? "Success" : "Fail"
    redirect_to admin_grades_path
  end
  

  private
  def grade_params
    params.require(:grade).permit(:name,:teacher_id,:num_of_students,:start_date, :start_hour, :start_minute, :duration, :repeat_wday,:status,:desc)
  end
  
end
